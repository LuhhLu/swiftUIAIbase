 




import SwiftUI
struct PasswordCheckField: View {
    @Binding var text: String
    @FocusState var isActive
   @State var checkMinChars = false
   @State var checkLetter = false
   @State var checkPunctuation = false
   @State var checkNumber = false
   @State var showPassword = false
   var progressColor:Color{
       let containsLetters = text.rangeOfCharacter(from: .letters) != nil
       let containsNumbers = text .rangeOfCharacter(from: .decimalDigits) != nil
       let containsPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&$")) != nil
       if containsLetters && containsNumbers && containsPunctuation && text.count >= 8{
           return Color.green
       }else if containsLetters && !containsNumbers && !containsPunctuation{
           return Color .red
       }
       else if containsNumbers && !containsLetters && !containsPunctuation{
           return Color .red
       }
       else if containsLetters && containsNumbers && !containsPunctuation{
           return Color .yellow
       }
       else if containsLetters && containsNumbers && containsPunctuation{
           return Color .blue
       }
       else {
           return .gray
       }
   }
   var body: some View {
       VStack(alignment: .leading, spacing: 24) {
           ZStack(alignment:.leading){
               ZStack {
                       SecureField("Password", text: $text)
                           .padding(.leading)
                           .frame(maxWidth: .infinity)
                           .frame(height: 55).focused($isActive)
                           .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
                           .opacity(showPassword ? 0 : 1)
                       TextField("", text: $text)
                           .padding(.leading)
                           .frame(maxWidth: .infinity)
                           .frame(height: 55).focused($isActive)
                           .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
                           .opacity(showPassword ? 1 : 0)
               }

                       .onChange(of: text, { oldValue, newValue in
                           withAnimation{
                               checkMinChars = newValue .count >= 8
                               checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                               checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                               checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&$")) != nil
                           }
                       })
  
           }
           .overlay(alignment: .trailing) {
               Image(systemName:showPassword ? "eye.fill" : "eye.slash.fill")
                   .foregroundStyle(showPassword ? .primary : .secondary)
                   .padding(16)
                   .contentShape(Rectangle())
                   .onTapGesture {
                       showPassword.toggle()
                   }
           }
           VStack(alignment: .leading, spacing: 10) {
               CheckText(text: "At least 8 characters", check: $checkMinChars)
               CheckText(text: "At least 1 Number", check: $checkNumber)
               CheckText(text: "At least 1 letter", check: $checkLetter)
               CheckText(text: "(!@#%*^&$)", check: $checkPunctuation)
           }
       }
    
   }
}

#Preview {
    PasswordCheckField(text: .constant(""))
}

struct CheckText: View {
   let text : String
   @Binding var check:Bool
   var body: some View {
       HStack{
           Image(systemName: check ? "checkmark.circle.fill" : "circle")
               .contentTransition(.symbolEffect)
           Text(text)
       }
       .foregroundColor(check ? .primary : .secondary)
   }
}
