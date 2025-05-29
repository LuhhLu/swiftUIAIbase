
import SwiftUI
struct PassTF: View {
   @State var text = ""
   @State var progress: CGFloat = 0
   @State var checkMinChars = false
   @State var checkLetter = false
   @State var checkPunctuation = false
   @State var checkNumber = false
   @State var showPassword = false
   var progressColor:Color{
       let containsLetters = text.rangeOfCharacter(from: .letters) != nil
       let containsNumbers = text .rangeOfCharacter(from: .decimalDigits) != nil
       let containsPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&")) != nil
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
       VStack(alignment: .leading, spacing: 20) {
           ZStack{
               if !showPassword{
                   SecureField("Password", text: $text)
                       .font(.title)
                       .frame(maxWidth: .infinity)
                       .onChange(of: text, { oldValue, newValue in
                           withAnimation{
                               progress = min(1.0 , max(0, CGFloat(newValue.count) / 8.0))
                               checkMinChars = newValue .count >= 8
                               checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                               checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                               checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&")) != nil
                               
                           }
                       })
 
                       .frame(height: 60)
   
               }else{
                   TextField("Password", text: $text)
                       .font(.title)
                       .onChange(of: text, { oldValue, newValue in
                           withAnimation{
                               progress = min(1.0 , max(0, CGFloat(newValue.count) / 8.0))
                               checkMinChars = newValue .count >= 8
                               checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                               checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                               checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&")) != nil
                               
                           }
                       })
                       .frame(maxWidth: .infinity)
                       .frame(height: 60)
                     
               }
               
           
               RoundedRectangle(cornerRadius: 10).trim(from: 0, to: progress)
                   .stroke(progressColor,lineWidth: 3)
                   .frame(height: 60)
                   .rotationEffect(.degrees(-180))
                   .padding(-10)
               
           }
           .overlay(alignment: .trailing) {
               Image(systemName:showPassword ? "eye.fill" : "eye.slash.fill")
                   .padding(.trailing,10)
                   .onTapGesture {
                       showPassword.toggle()
                   }
           }
           VStack(alignment: .leading, spacing: 10) {
               CheckText(text: "Minimum 8 characters", check: $checkMinChars)
               CheckText(text: "At least one letter", check: $checkLetter)
               CheckText(text: "(!@#$%*^&)", check: $checkPunctuation)
               CheckText(text: "Number", check: $checkNumber)
           }
       }
    
   }
}

#Preview {
   PassTF()
}


struct CheckText: View {
   let text : String
   @Binding var check:Bool
   var body: some View {
       HStack{
           Image(systemName: check ? "checkmark.circle.fill" : "circle")
           Text(text)
       }
       .foregroundColor(check ? .green : .gray)
   }
}
