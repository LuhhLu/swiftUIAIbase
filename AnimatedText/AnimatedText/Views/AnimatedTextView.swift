import SwiftUI

struct AnimatedTextView: View {
    @State var activeIndex = 0
    let text = "Get early access"
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<text.count, id: \.self) { index in
                Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                    .font(.largeTitle)
                    .foregroundColor(shouldScale(index) ? .white : .gray.opacity(0.3))
                    .scaleEffect(shouldScale(index) ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.9), value: activeIndex)
            }
        }
        .onAppear {
            startAnimationLoop()
        }
    }
    
    func shouldScale(_ index: Int) -> Bool {
        let groupStartIndex = (activeIndex / 5) * 5
        let groupEndIndex = groupStartIndex + (activeIndex % 5)
        return index >= groupStartIndex && index <= groupEndIndex
    }
    func startAnimationLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation {
                if activeIndex + 1 >= text.count {activeIndex = 0}
                else { activeIndex += 1}
            }
        }
    }
}



#Preview {
    AnimatedTextView()
}

//
//
//import SwiftUI
//
//struct AnimatedTextView: View {
//    @State private var activeIndex = 0
//    let text = "Get early access"
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<text.count, id: \.self) { index in
//                Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//                    .font(.largeTitle)
//                    .foregroundColor(shouldScale(index) ? .white : .gray.opacity(0.3))
//                    .scaleEffect(shouldScale(index) ? 1.2 : 1.0)
//                    .animation(.easeInOut(duration: 1.3), value: activeIndex)
//            }
//        }
//        .onAppear {
//            startAnimationLoop()
//        }
//    }
//    func shouldScale(_ index: Int) -> Bool {
//        return index >= activeIndex && index < activeIndex + 5
//    }
//    func startAnimationLoop() {
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
//            withAnimation {
//                if activeIndex + 5 >= text.count {
//                    activeIndex = 0
//                } else {
//                    activeIndex += 5
//                }
//            }
//        }
//    }
//}
//
//
//
//
//#Preview {
//    AnimatedTextView()
//}


//
//import SwiftUI
//
//struct AnimatedTextView: View {
//    @State private var activeIndex = 0
//    let text = "Get early access"
//    
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<text.count, id: \.self) { index in
//                Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//                    .font(.largeTitle)
//                    .foregroundColor(shouldScale(index) ? .white : .gray.opacity(0.3))
//                    .scaleEffect(shouldScale(index) ? 1.2 : 1.0)
//                    .animation(.easeInOut(duration: 0.3), value: activeIndex)
//            }
//        }
//        .onAppear {
//            startAnimationLoop()
//        }
//    }
//    
//    func shouldScale(_ index: Int) -> Bool {
//        return index == activeIndex
//    }
//    
//    func startAnimationLoop() {
//        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
//            withAnimation {
//                if activeIndex + 1 >= text.count {
//                    activeIndex = 0
//                } else {
//                    activeIndex += 1
//                }
//            }
//        }
//    }
//}
//
