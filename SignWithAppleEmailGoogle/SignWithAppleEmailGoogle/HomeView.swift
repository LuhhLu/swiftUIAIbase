
import FirebaseAuth
import SwiftUI

struct HomeView: View {
    @State var email = ""
    @State var Password = ""
    @State var Remember = false
    @State var showSignUp = false
    
    @State private var userService = UserService()
    init() {
        if !userService.persistence {
            userService.logout()
        }
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            if showSignUp{
                SignUP(email: $email, password: $Password, Remember: $Remember, showSignIn: $showSignUp, action: {})
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            } else {
                switch userService.state {
                    case .authorized(let user):
                    VStack {
                        Text("Hello \(user.email ?? "")")
                        Button(action: userService.logout) {
                            Text("Logout")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .trailing))
                case .unauthorized:
                    SignIn(email: $email, Password: $Password, isRememberMeSelected: $Remember, showSignUp: $showSignUp, action: {})
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .environment(userService)
    }
}

@Observable
class UserService {
    var state: State
    
    @ObservationIgnored
    @AppStorage("userPersistence") var persistence: Bool = false
    
    enum State {
        case authorized(FirebaseAuth.User)
        case unauthorized
    }
    
    init() {
        if let user = Auth.auth().currentUser {
            state = .authorized(user)
        } else {
            state = .unauthorized
        }
    }
    
    func logout() {
        try? Auth.auth().signOut()
        withAnimation { state = .unauthorized }
    }
}

#Preview {
    HomeView()
        .environment(UserService())
}
