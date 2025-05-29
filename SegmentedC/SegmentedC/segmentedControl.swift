
import SwiftUI
struct segmentedControl: View {
   @Binding var selectedTab:Tab
   @State var tabProgress:CGFloat = 0
   @State var textWidth: CGFloat = 0
   @State var textWidths: [CGFloat] = Array(repeating: 0, count: Tab.allCases.count)
   @State var indexint:CGFloat = 0
   @State var hstackwidth:CGFloat = 0
   var body: some View {
       ScrollViewReader { scrollProxy in
           ScrollView(.horizontal,showsIndicators: false) {
               HStack(spacing:30){
                   ForEach(Tab.allCases.indices,id:\.self) { index in
                       let tab = Tab.allCases[index]
                       HStack(spacing:0){
                           Text(tab.rawValue)
                               .font(.callout)
                               .background(GeometryReader { textGeometry -> Color in
                                   DispatchQueue.main.async {
                                       textWidths[index] = textGeometry.size.width
                                   }
                                   return Color.clear
                               })
                               .frame(width: 70,alignment: .leading)
                               .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                               .id(index)
                       }
                       .padding(.vertical,10)
                       .onTapGesture {
                           withAnimation {
                               indexint = CGFloat(index)
                               textWidth = textWidths[index]
                               selectedTab = tab
                           }
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                               withAnimation {
                                   scrollProxy.scrollTo(index, anchor: .center)
                               }
                           }
                       }
                   }
               }
               .background(GeometryReader { textGeometry -> Color in
                   DispatchQueue.main.async {
                      hstackwidth = textGeometry.size.width
                   }
                   return Color.clear
               })
               .background(
                   GeometryReader { geo in
                       Capsule()
                           .foregroundStyle(.gray.opacity(0.3))
                           .frame(width: textWidth + 30)
                           .offset(x: indexint * 100)
                           .offset(x: -15)
                   }
               )
               .padding(.horizontal,25)
           }

       }
//        }
       .onAppear(){
           if textWidth == 0 {
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                   textWidth = textWidths[0]
               }
           }
       }
   }
}
//#Preview {
//    segmentedControl()
//}
enum Tab:String,CaseIterable{
   case all = "All"
   case fiction = "Fiction"
   case mystery = "Mystery"
   case romance = "Romance"
   case action = "Action"
   case comedy = "Comedy"
 
   
}
