

import SwiftUI
struct ContentView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var isFirstNameEditing = false
    @State var isLastNameEditing = false
    @State var isEmailEditing = false
    @State var isPasswordEditing = false
    var body: some View {
        VStack{
            Spacer()
            TextFieldAnimation(text: $firstName, title: "firstName", isEditing: $isFirstNameEditing)
            TextFieldAnimation(text: $lastName, title: "Lastname", isEditing: $isLastNameEditing)
            TextFieldAnimation(text: $email, title: "Email", isEditing: $isEmailEditing)
            TextFieldAnimation(text: $password, title: "password", isEditing: $isPasswordEditing)
           
          
            Spacer()
        }
      
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct TextFieldAnimation: View {
    @Binding var text: String
    var title: String
    @Binding var isEditing: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            ZStack(alignment: .leading){
                Text(title.uppercased())
                    .font(.system(size:  isEditing ? 13 : 30))
                    .offset(y: isEditing ? -18 : 0)
                    TextField("",text: $text) { editing in
                        withAnimation {
                            isEditing = editing || !text.isEmpty
                        }
                    }
                
               
            }
            Rectangle()
                .frame(width: 300, height: 3)
        }
        .frame(height: 80)
        
    }
}
