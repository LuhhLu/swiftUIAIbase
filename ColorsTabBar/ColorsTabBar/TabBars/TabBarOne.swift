
import SwiftUI
struct TabBarOne: View {
   @State var selectedTab:Tap = .home
   var body: some View {
       
         
           HStack{
               ForEach(tapItems) { item in
                   Button(action: {
                       withAnimation{
                           selectedTab = item.tap
                       }

                   }, label: {
                       VStack(spacing: 0){
                           Image(systemName: item.icon)
                               .symbolVariant(.fill)
                               .font(.body.bold())
                               .frame(width: 30, height: 30)

                       }
                       .frame(maxWidth: .infinity)
                   })
                   .foregroundStyle(selectedTab == item.tap ? Color("newC"):.secondary)
               }
           }
           .frame(width: 350, height: 90)

           .background(
               ZStack{
                   RoundedRectangle(cornerRadius: 30, style: .continuous)
                       .fill(
                           LinearGradient(gradient: Gradient(colors: [Color("3d5"),.white]), startPoint: .top, endPoint: .bottomTrailing)
                       )
                       .blur(radius: 10)
                       .offset(x: -10, y: -10)
                   RoundedRectangle(cornerRadius: 30, style: .continuous)
                       .fill(
                           LinearGradient(gradient: Gradient(colors: [Color("3d5"),.white]), startPoint: .top, endPoint: .bottom)
                       )
//                       .padding(2)
//                       .blur(radius: 1)
//                   RoundedRectangle(cornerRadius: 30, style: .continuous)
//                       .stroke(lineWidth: 0.1)
//                       .blur(radius: 1)
               }
           )
           .overlay(content: {
               HStack{
                   if selectedTab == .maginf{Spacer()}
                   if selectedTab == .rect{Spacer()}
                   if selectedTab == .bell {
                       Spacer()
                       Spacer()

                   }
                   Circle()
                       .frame(width: 8, height: 8)
                       .foregroundColor(Color("newC"))
                       .frame(width: 65)
                       .frame(maxHeight: 50,alignment: .bottom)
                   if selectedTab == .home{Spacer()}
                   if selectedTab == .maginf{
                       Spacer()
                       Spacer()

                   }
                   if selectedTab == .bell {Spacer()}
               }
               .padding(.horizontal,8)
           })
           .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
           .shadow(color: .black.opacity(0.2), radius: 20, x: 50, y: 30)
           .frame(maxHeight: .infinity,alignment: .bottom)


   }
}

struct TabBarOne_Previews: PreviewProvider {
   static var previews: some View {
       TabBarOne()
   }
}

 

