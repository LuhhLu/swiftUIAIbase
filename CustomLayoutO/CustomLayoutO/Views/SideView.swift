
import SwiftUI
struct SideView: View {
    @State var dark = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Binding var selection: ContentViewSelection
   var body: some View {
       VStack(spacing:20) {
           Spacer()
           sideButton(title: "Home", icon: "house") {
               selection = .home
           }
           sideButton(title: "Purchase", icon: "cart") {
               selection = .purchase
           }
           sideButton(title: "Favorite", icon: "star") {
               selection = .favorite
           }
           sideButton(title: "Trash", icon: "trash") {
               selection = .trash
           }
           
           Spacer()
           Toggle(isOn:$isDarkMode, label: {
               Text("Dark").bold()
                   .padding(.leading,18)
               
           })
           .tint(.gray)
           .preferredColorScheme(isDarkMode ? .dark : .light)
           Spacer()
       }
       .frame(width: 200)
       .frame(maxWidth: .infinity,alignment: .leading)

       
       
   }
}

#Preview {
    SideView(selection: .constant(.home))
}
struct sideButton: View {
   var title:String
   var icon:String
    var action: () -> Void  
    @Environment(\.colorScheme) var colorScheme
    
   var body: some View {
       Button(action: {
           action()
       }, label: {
           HStack{
               Image(systemName: icon)
                   .foregroundStyle(colorScheme == .dark ? .white.opacity(0.7) : .black.opacity(0.7) )
               Text(title)
                   .font(.system(size: 17))
                   .foregroundStyle(.gray)
           }
           .font(.system(size: 20))
           .padding(.leading)
           .frame(width:200, height: 50,alignment: .leading)
           .background(
               RoundedRectangle(cornerRadius: 10)
                   .stroke(lineWidth: 0.9)
                   .foregroundStyle(.gray.opacity(0.25))
           )
       })
       .padding(.leading,30)
   }
}
