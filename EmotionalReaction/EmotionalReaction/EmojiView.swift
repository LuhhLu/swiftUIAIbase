 

import SwiftUI

struct Icon {
    var icon: String
    var isVisible: Bool = false
}

struct EmojiView: View {
    @State var  show = false
    @State var icons: [Icon] = [
        Icon(icon: "❤️"),
        Icon(icon: "👍"),
        Icon(icon: "☹️"),
        Icon(icon: "😍"),
        Icon(icon: "😄"),
        Icon(icon: "🤓")
    ]
    @Binding var selectedIcon: String
    var body: some View {
        HStack(spacing:20){
            ForEach(icons.indices,id: \.self) { index in
                IconView(icon: $icons[index].icon, isVisible: $icons[index].isVisible, selectedIcon: $selectedIcon)
                    .animation(Animation.spring().delay(Double(index) * 0.2), value: icons[index].isVisible)
            }
        }
        .frame(width: show ? 280 : 40, height: 40)
        .background(Color(.BG),in:RoundedRectangle(cornerRadius: 40))
        
        
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 0.2)) {
                show = true
            }
            for index in icons.indices{
                icons [index].isVisible = true
            }
        })
       
    }
}

#Preview {
    EmojiView(selectedIcon: .constant(""))
}

struct IconView: View {
    @Binding var icon : String
    @Binding var isVisible :Bool
    @State var isTapped: Bool = false
    @Binding var selectedIcon: String
    var body: some View {
        Text(icon).offset(y: 1.5)
            .font(.title2)
            .scaleEffect(isTapped ? 1.8 : (isVisible ? 1 : 0))
            .onTapGesture {
                withAnimation {
                    isTapped = true
                    selectedIcon = (selectedIcon == icon) ? "" : icon
                }
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation {
                        isTapped = false
                    }
            }
        
        
            
        }
        
    }
}

 
