
import SwiftUI
struct ContentView: View {
   @State private var word1 = "ignite"
   @State private var word2 = "explore"
   let options1 = [
       WordOption(label: "ignite") { print("ignite") },
       WordOption(label: "inspire change") { print("inspire change") },
       WordOption(label: "spark curiosity") { print("spark curiosity") },
       WordOption(label: "shape emotion") { print("shape emotion") },
       WordOption(label: "move people") { print("move people") }
   ]
   let options2 = [
       WordOption(label: "explore") { print("explore") },
       WordOption(label: "create freely") { print("create freely") },
       WordOption(label: "push limits") { print("push limits") },
       WordOption(label: "take chances") { print("take chances") },
       WordOption(label: "try boldly") { print("try boldly") },
       WordOption(label: "grow creatively") { print("grow creatively") }
   ]
   var body: some View {
       VStack {
           title
           VStack(alignment:.leading){
               HStack(spacing: 0) {
                   Text("You will")
                   WordSelector(selectedWord: $word2, options: options2, Yoffset: 140)
                   Text("more with time")
               }
               .zIndex(2)
               // .frame(height: 40) because without it will be very large, so just to make sure he will take the frame  else will push everything to vertically
               .frame(height: 40)
//                    .offset(y: 50)
               HStack(spacing: 0) {
                   Text("Ideas")
                   WordSelector(selectedWord: $word1, options: options1, Yoffset: 120)
                   Text("spark minds and")
               }
               .frame(height: 40)
           }
           .frame(maxWidth: .infinity,alignment: .leading)
               .offset(y: -15)
           imagesRow()
           // the  .zIndex(-3) to make sure the  imagesRow() is behind the selection Elsa can't select anything
               .zIndex(-3)
           Spacer()
           TextF
       }
       .padding()
   }
   
   var title:some View{
       VStack{
           Text("AI IMAGE")
           Text("GENERATION")
       }
       .bold()
       .font(.system(size: 50))
   }
   
   var TextF:some View{
       TextField("Type a prompt", text: .constant(""))
           .padding(.leading)
           .frame(height: 50)
           .background(.gray.opacity(0.3),in:.rect(cornerRadius: 8))
           .overlay(alignment: .trailing, content: {
               Image(systemName: "paperplane.fill")
                   .padding()
           })
           .padding(.bottom,24)
   }
}

#Preview {
   ContentView()
}
