
import SwiftUI

struct NavHeader: View {
   var scrollOffset: CGFloat
   var title:String
   var profileImage:ImageResource
   var body: some View {
       ZStack {
           Color.clear
               .frame(height: interpolatedHeight())
               .background(.ultraThinMaterial.opacity(opastyview()))
               .blur(radius: 0.5)
               .edgesIgnoringSafeArea(.top)
           HStack {
               Image(.sideIcon).renderingMode(.template)
                   .resizable().scaledToFill()
                   .foregroundStyle(.primary)
                   .frame(width:  SideIcon(), height:  SideIcon())
               
               Spacer()
               Text(title).bold()
                   .font(.system(size: interpolatedOText()))
                   .offset(x: 10)
               Spacer()
               Image(profileImage).resizable().scaledToFill()
                   .frame(width:  ProImage(), height:  ProImage())
           }
           .offset(y:PushupOffset())
           .padding()
       }
       .frame(maxHeight: .infinity, alignment: .top)
   }
 
   private func interpolatedHeight() -> CGFloat {
       let startHeight:CGFloat = 110
       let endHeight:CGFloat = 95
       let transitionOffset :CGFloat = 35
   let progress = min(max(scrollOffset / transitionOffset ,0 ) , 1)
       return  endHeight + (startHeight - endHeight) * progress
   }
   private func SideIcon() -> CGFloat {
    let theend: CGFloat = 20
    let thestart: CGFloat = 15
    let transitionOffset: CGFloat = 35
    let progress = min(max(scrollOffset / transitionOffset, 0), 1)
    return thestart + (theend - thestart) * progress
}
   private func ProImage() -> CGFloat {
       let theend: CGFloat = 40
       let thestart: CGFloat = 30
       let transitionOffset: CGFloat = 35
       let progress = min(max(scrollOffset / transitionOffset, 0), 1)
       return thestart + (theend - thestart) * progress
   }
   private func PushupOffset() -> CGFloat {
          let theend: CGFloat = -40
          let thestart: CGFloat = -30
          let transitionOffset: CGFloat = 50
          let progress = min(max(scrollOffset / transitionOffset, 0), 1)
          return theend + (thestart - theend) * progress
      }
   private func interpolatedOText() -> CGFloat {
          let theendOffset: CGFloat = 20
          let thestartOffset: CGFloat = 25
          let transitionOffset: CGFloat = 50
          let progress = min(max(scrollOffset / transitionOffset, 0), 1)
          return theendOffset + (thestartOffset - theendOffset) * progress
      }
   private func opastyview() -> CGFloat {
          let startOffset: CGFloat = 0
          let endOffset: CGFloat = 1
          let transitionOffset: CGFloat = 50
          let progress = min(max(scrollOffset / transitionOffset, 0), 1)
          return endOffset + (startOffset - endOffset) * progress
      }
}
struct CustomNavView<Content: View > : View {
   var title: String
   var profileImage:ImageResource
   let content: Content
   @State private var scrollOffset: CGFloat = 0
   init(title: String,profileImage:ImageResource,@ViewBuilder content: () -> Content) {
       self.title = title
       self.profileImage = profileImage
       self.content = content()
   }
   var body: some View {
       
       GeometryReader{ geo in
           ScrollView {
               ScrollOffsetBackground { offset in
                   self.scrollOffset = offset - geo.safeAreaInsets.top
               }
               .frame(height: 0)
               content
           }
           .padding(.top,100)
           .ignoresSafeArea()
           .safeAreaInset(edge: .top, content: {
               Color.clear.frame(height: 40)
           })
           .overlay {
               NavHeader(scrollOffset: scrollOffset, title: title, profileImage: profileImage)
           }
           
       }
   }
}
struct ScrollOffsetBackground: View {
   var onOffsetChange: (CGFloat) -> Void
   var body: some View {
       GeometryReader{ geometry in
           Color.clear
               .preference(key: ViewOffsetKey.self , value: geometry.frame(in: .global).minY)
               .onPreferenceChange(ViewOffsetKey.self, perform: onOffsetChange)
           
       }
   }
}
struct ViewOffsetKey: PreferenceKey {
   static var defaultValue: CGFloat = 0
   static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
       value = nextValue()
   }
}
//#Preview {
//    HomeView()
//}
