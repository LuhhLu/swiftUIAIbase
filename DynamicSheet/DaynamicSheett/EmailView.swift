

import SwiftUI

struct EmailView: View {
   @Binding var currentView: Int
   var id: Namespace.ID
   @State var  offset = false
   @State var  email = ""
   @State var  pass = ""
   @FocusState var IsKeyboardOpen : Bool
   @Binding var keybordshow :Bool
    
   var body: some View {
       ZStack{
           RoundedRectangle(cornerRadius: 40, style: .continuous)
               .matchedGeometryEffect(id: "shape", in: id)
               .foregroundStyle(.white)
               .frame( height: 310 )
               .onChange(of: currentView) { newValue, oldValue in
                   offset = false
               }
           .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
               .frame(maxHeight: .infinity,alignment: .bottom)
           VStack(spacing: 20){
               Spacer()
               VStack(alignment: .leading,spacing: 20){
                   emil(titel: "Emil", text: $email, IsKeyboardOpen: _IsKeyboardOpen)
                   password(titel: "Password", text: $pass, padd: _IsKeyboardOpen)
               }
               ButtonS(text: "continue", currentView: $currentView, IsKeyboardopen: _IsKeyboardOpen)
           }
           .offset(y:offset ? 10 : 350)
           .padding()
           .onChange(of: IsKeyboardOpen) {
               keybordshow.toggle()
           }
      
       }
       .offset(y: keybordshow ? -360 : 0)
       .animation(.easeInOut, value: keybordshow)
       .ignoresSafeArea()
       .onAppear{
           withAnimation(.spring) {
               offset.toggle()
           }
       }
   }
}

//#Preview {
//    EmailView(currentView: .constant(0), keybordshow: .constant(false))
//}


struct emil: View {
var titel = ""
   @Binding var text :String
   @FocusState var IsKeyboardOpen:Bool
   var body: some View {
       VStack(alignment:.leading){
           Text(titel).bold().font(.title2)
           TextField(titel, text: $text)
               .padding()
               .focused($IsKeyboardOpen)
               .frame(height: 40)
               .background(.white,in:RoundedRectangle(cornerRadius: 5))
               .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
       }
   }
}


struct password: View {
var titel = ""
   @Binding var text :String
   @FocusState var padd:Bool
   var body: some View {
       VStack(alignment:.leading){
           Text(titel).bold().font(.title2)
           SecureField(titel, text: $text)
               .padding()
               .focused($padd)
               .frame(height: 40)
               .background(.white,in:RoundedRectangle(cornerRadius: 5))
               .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
       }
   }
}
