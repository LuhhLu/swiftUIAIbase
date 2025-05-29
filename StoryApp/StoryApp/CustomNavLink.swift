
import SwiftUI

struct ScrollOffsetKey:PreferenceKey{
   static var defaultValue:CGFloat = 0
   static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
       value += nextValue()
   }
}
struct CustomNavLinkView<Content:View>: View {
   @Environment(\.dismiss) var dismiss
   var title:String
   var content:Content
   @State var Yoffset:CGFloat = 0
   var action: () -> Void
   init(title: String,@ViewBuilder content: () -> Content,action: @escaping () -> Void) {
       self.title = title
       
       self.content = content()
       self.action = action
      
   }
   var body: some View {
//       ScrollView{
//           VStack{
               
               content
           .ignoresSafeArea()
                  
              
//           }
           
           .background(
               GeometryReader { geometry in
                   Color.clear.preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .global).minY)
                  
               }
           )
           .safeAreaPadding(.top)
//       }
       
       .onPreferenceChange(ScrollOffsetKey.self, perform: { value in
//            Yoffset = value / 50
           Yoffset = max(0.8 ,min(1,value / 100))
       })
       
             
           .navigationBarBackButtonHidden(true)
           .toolbar(content: {
               ToolbarItem(placement: .topBarLeading) {
                   backButton
               }
           })
           .toolbar(content: {
               ToolbarItem(placement: .principal) {
                   Text(title).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                       .scaleEffect(Yoffset)
               }
           })
           .toolbar(content: {
               ToolbarItem(placement: .topBarTrailing) {
                   bookmark
               }
           })
       
   }
   private var backButton: some View {
       Button(action: {
            dismiss()
       }) {
           Image(systemName: "chevron.left").bold().foregroundStyle(.white)
               .frame(width: 55, height: 55)
               .background(.ultraThinMaterial, in: Circle())
               .scaleEffect(Yoffset)

       }
   }
   private var bookmark: some View {
       Button(action: {
         action()
       }) {
           Image(systemName: "bookmark").bold().foregroundStyle(.white)
               .frame(width: 55, height: 55)
               .background(.ultraThinMaterial, in: Circle())
               .scaleEffect(Yoffset)

       }
   }

}


