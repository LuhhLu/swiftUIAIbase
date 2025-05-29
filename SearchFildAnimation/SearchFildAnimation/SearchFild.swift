
import SwiftUI

struct SearchFild: View {
   @State var show = false
   @State var text = ""
   @FocusState var Istyping:Bool
   var body: some View {
       ZStack {
           ZStack{
               Color.BG.ignoresSafeArea()
           }
           
           ZStack(alignment:.leading){
               
               RoundedRectangle(cornerRadius:show ? 15 : 30)
                     .foregroundStyle(.thinMaterial)
                     .shadow(color: .primary.opacity(0.1), radius: 0, x: 0, y: 6)
               HStack{
                   Image(systemName:show ? "xmark" : "magnifyingglass").font(.title2)
                       .foregroundStyle(.primary.opacity(0.5))
                       .contentTransition(.symbolEffect)
                       .onTapGesture {
                           withAnimation {
                               text = ""
                               show.toggle()
                               Istyping.toggle()
                           }
                       }
                   
                   TextField("Type here...", text: $text)
                   .focused($Istyping).opacity(show ? 1 : 0)
                   
               }
               .padding(.leading,11)
              
           }
           
           .frame(width:show ? 300 : 50, height: 50 )
           .frame(maxWidth: .infinity,alignment: .leading)
           .frame(height: 70).clipped().padding(.leading,45)
          
       }

   }
}

#Preview {
   SearchFild()
}
