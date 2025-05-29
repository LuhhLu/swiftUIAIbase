
import SwiftUI
class selectedmanager:ObservableObject{
    @Published var titel = ""
    @Published var selected :Tab = .foryou
}
struct model:Identifiable{
    var id = UUID()
    var titel : String
    var tab:Tab
}
enum Tab: String {
    case foryou
    case Following
}
var items : [model] = [
model(titel: "Following", tab: .Following),
model(titel: "For You", tab: .foryou)
]
struct ContentView: View {
    @StateObject var  vm = selectedmanager()
    @State var rotation = 0.00
    var body: some View {
        ZStack {
            pageview()
            VStack {
                HStack{
                    ForEach(items) { item in
                        Button(action: {
                            withAnimation{
                                vm.selected = item.tab
                            }
                            
                        }, label: {
                            Text(item.titel).bold()
                                .font(.title2)
                        })
                        .foregroundColor(vm.selected == item.tab ? .white : .gray)
                        
                    }
                }
                .overlay(content: {
                    HStack{
                        if vm.selected == .foryou {Spacer()}
                        Rectangle()
                            .frame(width: 40, height: 4)
                            .offset(y:20)
                        if vm.selected == .Following {Spacer()}
                        
                    }
                    .padding(.leading,8)
                    .frame(width: 140)
                })
                Spacer()
                 
                HStack(alignment: .bottom) {
                    textview()
                    VStack(spacing: 15){
                                userimage()
                                icons(iconname: "heart.fill", num: "987")
                                icons(iconname: "ellipsis.message.fill", num: "987")
                                icons(iconname: "bookmark.fill", num: "987")
                                icons(iconname: "arrowshape.turn.up.right.fill", num: "987")
                                musicC(rotation:$rotation)
                    }
                }
                .padding(.horizontal,5)
                tabBar()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct icons: View {
    var iconname = ""
    var num = ""
    var body: some View {
        VStack{
            Image(systemName: iconname)
                .font(.system(size: 35))
            Text(num).bold()
        }
        .foregroundColor(.white)
    }
}

struct userimage: View {
    var body: some View {
        Image("Firebase")
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(alignment: .bottom, content: {
                Image(systemName: "plus").bold()
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.red)
                    .clipShape(Circle())
                    .offset(y: 10)
                
            })
            .padding(.vertical)
             
    }
}

struct musicC: View {
    @Binding var rotation:Double
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray)
            .overlay(content: {
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                    Text("SwiftUi").bold()
                        .font(.system(size: 9))
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(rotation))
                        .onAppear{
                            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                                self.rotation = 360
                            }
                        }
                        
                    
                }
               
                
            })
        
    }
}
