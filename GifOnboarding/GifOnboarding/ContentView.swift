 
import SwiftUI
import WebKit
struct CustomTransition :ViewModifier{
    func body(content: Content) -> some View {
        content
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
    }
}
extension View{
    func customTransition() -> some View{
        self.modifier(CustomTransition())
    }
}


struct ContentView: View {
    @State var  step = 0
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            ZStack{
                switch step{
                case 0:
                    Startview(step: $step)
                        .customTransition()
                case 1:
                    LikeGifView(step: $step)
                        .customTransition()
                case 2:
                    SaveGifView(step: $step)
                        .customTransition()
                default:
                    HomePage()
                        .customTransition()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


 
struct GifWebView:UIViewRepresentable{
    let gifName :String
    func makeUIView(context: Context) -> WKWebView{
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: gifName, withExtension: "gif"){
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                uiView.load(request)
            }
        }
         
    }
}
struct CButton: View {
    var titel = "Continue"
    @Binding var step :Int
    var body: some View {
        Button(action: {
            withAnimation {
                if step <= 3{
                    step += 1
                }
            }
        }, label: {
            Text(titel).foregroundStyle(.white).font(.system(size: 28))
                .frame(width: 350, height: 65)
                .background(.black,in:RoundedRectangle(cornerRadius: 40))
        })
    }
}

 
