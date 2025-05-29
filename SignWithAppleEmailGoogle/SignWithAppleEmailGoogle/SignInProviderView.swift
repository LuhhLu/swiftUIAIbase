 
 
import AuthenticationServices
import GoogleSignIn
import FirebaseAuth
import SwiftUI

struct SignInProvider: View {
    let action: Action
    let provider: Provider
    
    @Environment(UserService.self) private var userService
    @Environment(\.colorScheme) var colorScheme
    init(with provider: Provider, action: Action) {
        self.action = action
        self.provider = provider
    }
    
    var body: some View {
        switch provider {
        case .apple:
       SignInWithAppleButton(
        action.appleLabel,onRequest: configureAppleAuthorization(_:),
        onCompletion: handleAppleAuthorization(_:)
       )
       .signInWithAppleButtonStyle(.white)
       .frame(height: 55)
       .clipShape(Capsule())
       .frame(maxWidth: .infinity)
                
        case .google:
            Button(action: signInWithGoogle) {
                HStack( spacing: 5) {
                    Image(provider.image).renderingMode(.template)
                        .resizable().scaledToFill()
                        .frame(width: 18, height: 18)
                    Text("Sign in with google").font(.system(size: 20).bold())
                    
                }.foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.primary,in:.capsule)
            }
            .tint(.primary)
        }
    }
    
    enum Provider {
        case apple, google
        
        var image: ImageResource {
            switch self {
            case .apple: return .apple
            case .google: return .google
            }
        }
    }
    
    enum Action {
        case signIn, signUp
        
        var appleLabel: SignInWithAppleButton.Label {
            switch self {
            case .signIn:
                    .signIn
            case .signUp:
                    .signUp
            }
        }
    }
    
    private func configureAppleAuthorization(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    private func handleAppleAuthorization(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authorization):
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                let idToken = appleIDCredential.identityToken
                let rawNonce = generateNonce()
                
                guard let idTokenString = idToken.map({ String(data: $0, encoding: .utf8) }) else {
                    print("Unable to serialize ID token.")
                    return
                }
                
                let credential = OAuthProvider.credential(
                    providerID: .apple,
                    idToken: idTokenString ?? "",
                    rawNonce: rawNonce
                )
                
                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        userService.persistence = true
                        withAnimation {
                            userService.state = .authorized(result.user)
                        }
                    } catch {
                        print("Error signing in with Apple: \(error.localizedDescription)")
                    }
                }
            }
        case .failure(let error):
            print("Authorization failed: \(error.localizedDescription)")
        }
    }
    
    private func generateNonce() -> String {
        let nonce = UUID().uuidString
        return nonce
    }
    
    func signInWithGoogle() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return }
        
        Task {
            do {
                let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
                guard let idToken = result.user.idToken else { return }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: result.user.accessToken.tokenString)
                let authResult = try await Auth.auth().signIn(with: credential)
                
                userService.persistence = true
                userService.state = .authorized(authResult.user)
            } catch {
                print(error)
            }
        }
    }
}
