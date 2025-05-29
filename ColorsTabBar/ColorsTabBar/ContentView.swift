
import SwiftUI
struct TapItems:Identifiable{
   var id = UUID()
   var icon : String
   var tap:Tap
}
var tapItems = [
   TapItems(icon: "house", tap: .home),
   TapItems(icon: "magnifyingglass", tap: .maginf),
   TapItems(icon: "bell", tap: .bell),
   TapItems(icon: "rectangle.stack", tap: .rect)
]
enum Tap :String{
   case home
   case maginf
   case bell
   case rect
}
struct ContentView: View {
    @State var selectedTab:Tap = .home
    @State var onMode = false
    @State var trimValue:CGFloat = 0.0
    var body: some View {
        ZStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red)
                    .frame(width: 350, height: 80)
                    .offset(x: -3, y: 3)
                    .blur(radius: 4)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                    .frame(width: 350, height: 80)
                    .offset(x: 3, y: 3)
                    .blur(radius: 4)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black.opacity(0.4))
                    .frame(width: 345, height: 80)
                    .offset(y: 5)
                    .blur(radius: 6)
                
            }
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.black)
                .frame(width: 350, height: 80)
                .overlay {
                    HStack{
                        ForEach(tapItems) { item in
                            Button {
                                withAnimation {
                                    selectedTab = item.tap
                                    self.onMode = false
                                    self.trimValue = 0.0
                                }
                                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                                    self.onMode = true
                                }
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    self.trimValue = 1.0
                                }
                            } label: {
                                ZStack{
                                    if selectedTab == item.tap{
                                        Circle()
                                            .foregroundStyle(
                                                AngularGradient(colors: [.red,.yellow,.green,.purple,.red], center: .center)
                                            )
                                            .mask {
                                                Circle()
                                                    .trim(from: 0.0,to: trimValue)
                                                    .stroke(style: StrokeStyle(lineWidth: 3,lineCap: .round,lineJoin: .round))
                                                    .rotationEffect(Angle(degrees: -270))
                                                    .frame(height: 40)
                                            }
                                            .rotationEffect(.degrees(onMode ? 360 : 0))
                                        
                                    }
                                    Image(systemName: item.icon).bold()
                                        
                                        .foregroundColor(.white)
                                     
                                }
                                .frame(maxWidth: .infinity)
                            }

                        }
                    }
                }
        }
        .frame(maxHeight: .infinity,alignment: .bottom)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)) {
                self.trimValue = 1.0
            }
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.onMode = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
