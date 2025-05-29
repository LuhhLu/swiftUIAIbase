 

import SwiftUI

struct ContentView: View {
    @State private var rotateCircles = false
    @State private var c1 = false
    @State private var c2 = false
    @State private var isButtonDisabled = false
    @State private var showloding = false
    @State private var navigateToHome = false

    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                if showloding{
                    CirclesView(rotateCircles: $rotateCircles, c1: $c1, c2: $c2)
                }
                Spacer()
                Button {
                    withAnimation {
                        showloding = true
                    }
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        rotateCircles = true
                    }
                    withAnimation(.linear(duration: 0.7).delay(0.5).repeatForever(autoreverses: false)) {
                        c1 = true
                    }
                    withAnimation(.linear(duration: 0.9).delay(0.5).repeatForever(autoreverses: false)) {
                        c2 = true
                    }
                    isButtonDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        navigateToHome = true
                        isButtonDisabled = false
                        showloding = false
                        rotateCircles = false
                        c1 = false
                        c2 = false
                        
                    }
                } label: {
                    
                    Text("Pay now").foregroundStyle(.white).bold()
                        .frame(width: 150, height: 50)
                        .background(isButtonDisabled ? .gray : .black,in:RoundedRectangle(cornerRadius: 15))
                    
                    
                }
                .disabled(isButtonDisabled)
                .padding()

            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
            .navigationTitle("Home")
    }
}
