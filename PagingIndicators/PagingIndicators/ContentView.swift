 
import SwiftUI
struct ColorItem: Identifiable {
    let id = UUID()
    let color: Color
    
}
struct ContentView: View {
    @State private var currentIndex = 0
    var items: [ColorItem] = [
        ColorItem(color: .red),
        ColorItem(color: .yellow),
        ColorItem(color: .green),
        ColorItem(color: .red)
    ]
    @State var CurrentCircleNumber = 0
    @State var NextCircleNumber = 0
    @State var CurrentCircleWidth:CGFloat = 0
    @State var NextCircleWidth:CGFloat = 0
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        CardViewAnimation(show: .constant(currentIndex == index), item: item, index: index)
                            .pageIndicator(orientation: .vertical, currentCircleNumber: $CurrentCircleNumber, nextCircleNumber: $NextCircleNumber, currentCircleWidth: $CurrentCircleWidth, nextCircleWidth: $NextCircleWidth, index:.constant(index), currentIndex: $currentIndex )
                    }
                }
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollBounceBehavior(.basedOnSize)
            .overlay(alignment:.topTrailing) {
                VStack(spacing: 10) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Capsule()
                            .foregroundStyle(.black)
                            .frame(width: 10, height: index == CurrentCircleNumber ? 10 + CurrentCircleWidth : index == NextCircleNumber ? 10 + NextCircleWidth : 10)
                            .onTapGesture {
                                withAnimation {
                                    scrollProxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                }
                .offset(x: -30)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CardViewAnimation: View {
    @Binding var show: Bool
    var item:ColorItem
    var index:Int
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(item.color.gradient)
                .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                .id(index)
            Text("Thank you").bold().font(.largeTitle)
                .opacity(show ? 1 : 0)
                .offset(y: show ? 50 : 150)
               
        }
        
        .overlay(alignment: .topLeading, content: {
            Circle()
                .frame(width: show ? 350 : 0, height:  show ? 350 : 0)
                .foregroundStyle(.black.opacity(0.5))
                .offset(x: -50,y:-50)
        })
        .animation(.easeInOut, value: show)
        .clipped()
        
    }
}


