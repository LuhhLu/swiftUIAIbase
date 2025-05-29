 

import SwiftUI
struct iconsm {
    var name: String
    var color: Color
    let action: () -> Void
}
struct ContentView: View {
    @State   var showIcons: Bool = false
    @State   var iconmask: Bool = false
    @State   var scale = false
    @State   var rotat = false
    @GestureState var tapon = false
    var icons: [iconsm] {
        [
            iconsm(name: "calendar", color: .red, action: self.actionCalendar),
            iconsm(name: "keyboard", color: .yellow, action: self.actionKeyboard),
            iconsm(name: "camera", color: .green, action: self.actionCamera),
            iconsm(name: "quote.bubble", color: .blue, action: self.actionQuote),
            iconsm(name: "mic.fill", color: .pink, action: self.actionMic)
        ]
    }
  
    var body: some View {
        VStack {
          Spacer()
            ZStack(alignment: .leading) {
                HStack {
                    ForEach(icons.indices,id:\.self) { index in
                        Button(action: icons[index].action ) {
                            Image(systemName: icons[index].name).foregroundStyle(.black)
                                .frame(width: 50, height: 50)
                                .background(icons[index].color,in:Circle())
                                .scaleEffect(showIcons ? 1 : 0)
                                .rotationEffect(.degrees(showIcons ? 0 : 190))
                                .animation(.spring(response: 0.4, dampingFraction: 0.6).delay(showIcons ? Double(index) * 0.1 : Double(icons.count - index - 1) * 0.1), value: showIcons)
                        }
                    }
                }
                .mask {
                    HStack {
                        Rectangle()
                            .frame(width: iconmask ? 300 : 0, height: 60)
                        Spacer()
                    }
                }
                
                Image(systemName: "plus").font(.title2).bold().foregroundStyle(.black)
                    .frame(width: 50, height: 50)
                    .background(.white,in:Circle())
                    .rotationEffect(.degrees(tapon ? -360 : 0))
                    .rotationEffect(.degrees(rotat ? 135 : 0))
                    .scaleEffect(tapon ? 1.5 : 1)
                    .offset(x: showIcons ? 290 : 0)
                    .onTapGesture {
                        toggleIconAnimation()
                        
                    }
                    .gesture(LongPressGesture(minimumDuration: 1.5, maximumDistance: 50).updating($tapon, body: { state, gestur, transaction in
                        gestur = state
                    })
                             
                        .onEnded({ value in
                            toggleIconAnimation()
                        })
                             
                    )
                    .animation(.spring(response: 1.9, dampingFraction: 0.5), value: tapon)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
            }
        }
        .padding(20)
       
    }
    private func toggleIconAnimation() {
        scale.toggle()
        withAnimation(.linear(duration: 0.5)) {
            showIcons.toggle()
            rotat.toggle()
           
        }
        withAnimation(.linear(duration: iconmask ? 0.6 : 0.5)) {
            iconmask.toggle()
        }
      }
    private func actionCalendar() {
        print("Calendar icon tapped")
        toggleIconAnimation()
        
    }
    private func actionKeyboard() {
        print("Keyboard icon tapped")
        toggleIconAnimation()
    }
    private func actionCamera() {
        print("Camera icon tapped")
        toggleIconAnimation()
    }
    private func actionQuote() {
        print("Quote icon tapped")
        toggleIconAnimation()
    }
    private func actionMic() {
        print("Mic icon tapped")
        toggleIconAnimation()
    }

}

#Preview {
    ContentView()
}
