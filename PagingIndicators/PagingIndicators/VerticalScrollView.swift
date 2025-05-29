 
import SwiftUI

struct VerticalScrollView: View {
    @State private var currentIndex = 0
    var items: [ColorItem] = [
        ColorItem(color: .red),
        ColorItem(color: .orange),
        ColorItem(color: .green),
        ColorItem(color: .purple)
    ]
    @State var CurrentCircleNumber = 0
    @State var NextCircleNumber = 0
    @State var CurrentCircleWidth:CGFloat = 0
    @State var NextCircleWidth:CGFloat = 0
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        HCardViewAnimation(show: .constant(currentIndex == index), item: item, index: index)
                             .pageIndicator(orientation: .horizontal, currentCircleNumber: $CurrentCircleNumber, nextCircleNumber: $NextCircleNumber, currentCircleWidth: $CurrentCircleWidth, nextCircleWidth: $NextCircleWidth, index:.constant(index), currentIndex: $currentIndex )
                           
                    }
                    
                }
           
            }   
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .overlay(alignment:.bottom) {
                HStack(spacing: 10) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Capsule()
                            .foregroundStyle(.black.opacity(0.8))
                            .frame(width: index == CurrentCircleNumber ? 10 + CurrentCircleWidth : index == NextCircleNumber ? 10 + NextCircleWidth : 10, height:  10)
                            .onTapGesture {
                                withAnimation {
                                    scrollProxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                }
                .padding(.vertical,8)
                .padding(.horizontal,10)
                .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30))
                .offset(y: -50)
            }
        }
        
    }
}

#Preview {
    VerticalScrollView()
}

struct HCardViewAnimation: View {
    @Binding var show: Bool
    var item:ColorItem
    var index:Int
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(item.color.gradient )
                .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
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
