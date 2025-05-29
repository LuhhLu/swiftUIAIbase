 
import SwiftUI

struct HomeView: View {
    @State var email = ""
    @State var Password = ""
    @State var Remember = false
    @State var showSignUp = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            if showSignUp{
                SignUP(email: $email, Password: $Password, Remember: $Remember, showSignIn: $showSignUp, action: {})
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }else{
                SignIn(email: $email, Password: $Password, Remember: $Remember, showSignUp: $showSignUp, action: {})
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                    
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}


















#Preview {
    HomeView()
}
