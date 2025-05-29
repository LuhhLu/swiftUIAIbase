import SwiftUI
struct ContentView: View {
    var body: some View {
        ScrollView{
            PrallaxEffect()
            ContentList()
          
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PrallaxEffect: View {
    var body: some View {
        GeometryReader { geometry in
            let offsetY = geometry.frame(in: .global).minY
            let isScrolled = offsetY > 0
            Spacer()
                .frame(height: isScrolled ? 400 + offsetY : 400)
                .background {
                    Image("im")
                        .resizable()
                        .scaledToFill()
                        .offset(y: isScrolled ? -offsetY : 0)
                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                        .blur(radius: isScrolled ? offsetY / 20 : 0)
                        
                    
                }
        }
        //GeometryReader must give the length
        .frame(height: 400)
        
    }
}
struct ContentList: View {
    var body: some View {
        VStack(alignment: .leading){
            ForEach(0..<10) { _ in
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: 120, height: 25)
                VStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .frame(width: 280, height: 20)
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .frame(width: 250, height: 20)
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .frame(width: 160, height: 20)
                }
                .opacity(0.3)
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.top)
    }
}
