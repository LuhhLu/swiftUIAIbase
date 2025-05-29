

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var isShowingQRCode = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("QR Code Generator").bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top)
                    TextField("Enter text for QR code", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                Button {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                        isShowingQRCode.toggle()
                    }
                } label: {
                    Text("Generate QR Code")
                        .foregroundColor(.white)
                        .padding(.horizontal,40)
                        .padding(.vertical,12)
                        .background(.green)
                        .cornerRadius(10)
                }
                if isShowingQRCode{
                    QRCodeView(text: text)
                        .transition(AnyTransition.asymmetric(insertion: .scale(scale: 0.01).combined(with: .opacity), removal: .move(edge: .bottom).combined(with: .opacity)))
                }

                
                    
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
