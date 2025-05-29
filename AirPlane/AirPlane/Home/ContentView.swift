

import SwiftUI

struct ContentView: View {
    @State var showcamView = false
    var body: some View {
        ZStack{
            Image("so")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                .ignoresSafeArea()
            VStack{
                FlyProgress()
                Button {
                    showcamView.toggle()
                } label: {
                        Image("barcode")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 80)
                            .padding(.horizontal,5)
                            .background(.white.opacity(0.5))
                            .cornerRadius(10)
                    
                }.sheet(isPresented: $showcamView) {
                    BarCodeView()
                        .presentationDetents([.medium])
                }
                .offset(y: -100)
                Spacer()
            }
            .offset(y: 40)
            .overlay(alignment: .bottom) {
                scrollView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
