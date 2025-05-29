
import SwiftUI

struct AddView: View {
   @Binding var show:Bool
   @Binding var showTF :Bool
   @State var details = ""
   @State var text = ""
   @Binding var items: [ToDo]
   var body: some View {
       ZStack {
               VStack(spacing: 10){
                   HStack{
                       Button(action: {
                               let newItem = ToDo(titel: text, detils: details)
                               items.insert(newItem, at: 0)
                               text = ""
                               details = ""
                               show = false
                               showTF = false
                          }) {
                              Text("save").foregroundColor(.white)
                                  .frame(width: 80, height: 50)
                                  .background(.black)
                                  .offset(x: text.isEmpty ? -90 : 0 )
                                  .offset(x: -5, y: -6)
                               
                          }
                       
                       Spacer()
                       Image(systemName: "xmark").foregroundColor(.white)
                           .frame(width: 80, height: 50)
                           .background(.black)
                           .offset(x: text.isEmpty ? 0 : 90)
                           .offset(x: 2, y: -6)
                    
                           .onTapGesture {
                                   show = false
                                   showTF = false
                                 
                           }
                   }
                   .animation(.default, value: text)
                  
                   VStack(spacing: 10){
                       TextField("New Task", text: $text)
                           .padding()
                           .frame(height: 60)
                           .background(.white,in:RoundedRectangle(cornerRadius: 10))
                           .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
      
                       
         
                       VStack(alignment: .leading,spacing: 8){
                           Text("optional").foregroundColor(.gray)
                           TextField("Details", text: $details)
                               .padding()
                               .frame(height: 60)
                               .background(.white,in:RoundedRectangle(cornerRadius: 10))
                               .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
                       }
                       
                   }
                   .offset(y: showTF ? -5 : 220)
                  
                   .padding(.horizontal)
                   
               }
               .frame(width:show ? UIScreen.main.bounds.width - 20 : 0 ,height:show ?  230 : 0)
               .background(.white)
               .mask(RoundedRectangle(cornerRadius: 10))
               .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)

       }
   }
}

struct AddView_Previews: PreviewProvider {
   @State static var dummyItems = [ToDo(titel: "Sample", detils: "Details")]

   static var previews: some View {
       AddView(show: .constant(false), showTF: .constant(false), items: $dummyItems)
   }
}


