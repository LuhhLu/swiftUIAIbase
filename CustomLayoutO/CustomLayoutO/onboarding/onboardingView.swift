
import SwiftUI
struct ItemModel: Identifiable {
    var id = UUID()
    var title: String
    var ditels:String
    var image:String
}
struct onboardingView: View {
    @Binding  var currentIndex :Int
    var vm: [ItemModel] = [
        ItemModel( title: "Layout", ditels: "You can easily change the screen display from horizontal to vertical with LazyVGrid",image:"Layout" ),
        ItemModel( title: "Dark & Light  ", ditels: "Swiftly switch between dark and light mode.",image: "DL"),
        ItemModel( title: "Side Bar ", ditels: "With sidebar. Move between different screens using drag gesture", image: "SideBar")
    ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 500)
                        .foregroundStyle(.clear)
                    ForEach(0..<vm.count, id: \.self) { index in
                        if index == currentIndex {
                            dataView(data: vm[index], items: vm.count, currentIndex: index, image:vm[index].image )
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .animation(.easeInOut, value: currentIndex)
                }
                Spacer()
                GlowGradientButton(title: "next", action: {
                    withAnimation(.easeInOut) {
                        currentIndex += 1
                    }
                    
                })
                .frame(maxHeight: .infinity,alignment: .bottom)
                .padding(.bottom,60)
//                Spacer()
            }
           
        }
    }
}

#Preview {
//    ContentView(currentIndex:.constant(0) )
    StartView()
}
struct dataView: View {
    var data:ItemModel
    var items:Int
    var currentIndex:Int
    var image:String
    var body: some View {
        VStack(alignment:.leading ,spacing:20){
            Text("\(currentIndex + 1) of \(items)").bold().font(.title2)
            Text(data.title).bold().font(.system(size: 40))
            Text(data.ditels).font(.title3)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Image(data.image)
                .frame(maxWidth: .infinity)
                .padding(.top,40)
        }
        .foregroundStyle(.white)
        .padding()
 
    }
    
}


//
//
//import SwiftUI
//struct ItemModel: Identifiable {
//    var id = UUID()
//    var title: String
//    var ditels:String
//}
//struct onboardingView: View {
//    @Binding  var currentIndex :Int
//    var vm: [ItemModel] = [
//        ItemModel( title: "Gradient", ditels: "A color gradient represented as an array of color stops, each having a parametric location value."),
//        ItemModel( title: "Transition", ditels: "When this view appears or disappears, the transition will be applied to it, allowing for animating it in and out."),
//        ItemModel( title: "Button", ditels: "You create a button by providing an action and a label. The action is either a method or closure property that does something when a user clicks")
//    ]
//    var body: some View {
//        ZStack {
//            Color.vbg.ignoresSafeArea()
//            VStack(spacing:70){
//                ZStack{
//                    RoundedRectangle(cornerRadius: 25.0)
//                        .frame(height: 350)
//                        .foregroundStyle(.clear)
//                    ForEach(0..<vm.count, id: \.self) { index in
//                        if index == currentIndex {
//                            dataView(data: vm[index], items: vm.count, currentIndex: index)
//                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
//                                .frame(maxWidth: .infinity)
//                        }
//                        
//                    }
//                    .animation(.easeInOut, value: currentIndex)
//                }
//
//                GlowGradientButton(title: "next", action: {
//                    withAnimation(.easeInOut) {
//                        currentIndex += 1
//                    }
//                    
//                })
//            }
//           
//        }
//    }
//}
//
//#Preview {
////    ContentView(currentIndex:.constant(0) )
//    StartView()
//}
//struct dataView: View {
//    var data:ItemModel
//    var items:Int
//    var currentIndex:Int
//    var body: some View {
//        VStack(alignment:.leading ,spacing:20){
//            Text("\(currentIndex + 1) of \(items)").bold().font(.title2)
//            Text(data.title).bold().font(.system(size: 40))
//            Text(data.ditels).font(.title3)
//            Spacer()
//        }
//        .foregroundStyle(.white)
//        .padding()
//        .frame(width: 300, height: 350)
//        .background(.bcolor,in:.rect(cornerRadius: 25))
//        .overlay {
//            RoundedRectangle(cornerRadius: 25)
//                .stroke(lineWidth: 2)
//                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.2),.clear,.clear]), startPoint: .topTrailing, endPoint: .bottomLeading))
//                .blur(radius: 1)
//        }
//        .overlay {
//            RoundedRectangle(cornerRadius: 25)
//                .stroke(lineWidth: 2)
//                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.clear,.black.opacity(0.7)]), startPoint: .topTrailing, endPoint: .bottomLeading))
//                .padding(1)
//                .blur(radius: 2 )
//        }
//    }
//    
//}
