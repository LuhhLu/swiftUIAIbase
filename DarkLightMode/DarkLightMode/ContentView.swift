 

import SwiftUI

struct ContentView: View {
    @State private var appearanceMode: AppearanceMode = .dark
    @State private var colorScheme: ColorScheme? = nil
    @State var show = true
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, world!")
                    .foregroundStyle(.primary)
                Button(action: {
                    withAnimation {
                        show.toggle()
                    }
                }, label: {
                    Text("Appearance").bold().font(.title2)
                        .frame(width: 200, height: 60)
                        .background(.buttonBG,in:RoundedRectangle(cornerRadius: 20))
                })
                .tint(.selectedT)
               
            }
            DLMode(appearanceMode: $appearanceMode, colorScheme: $colorScheme, show: $show)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
