 
import SwiftUI

struct DataModel: Identifiable {
    let id = UUID()
    let title: String
    let content: AnyView
}
struct ExSoneView : View  {
    var vm:DataModel
    @State var show = false
    var body: some View {
        VStack{
            VStack( spacing: show ? 14 : 0) {
                HStack{
                    Text(vm.title)
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(show ? 90 : 0))
             
                }
                if !show{
                    Spacer()
                }
                vm.content
                    .fixedSize(horizontal: false, vertical: true)
                    .opacity(show ? 1 : 0)
                
            }
            .frame(maxHeight: show ? .none : 25 ,alignment: .top)
            .padding()
            .background(.BG,in: .rect(cornerRadius: 12))
            .clipped()
            .onTapGesture {
                withAnimation {
                    show.toggle()
                }
            }
        }
    }
}
#Preview{
    HomeView()
//    ExView(vm: DataModel(title: "Text", content:AnyView(Text(""))))
}
 
 
