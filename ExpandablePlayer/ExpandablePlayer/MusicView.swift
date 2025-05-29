 

import SwiftUI

struct MusicView: View {
    @State var show = false
    @State var dragOffset: CGFloat = 0
    @State var lastDragPosition: CGFloat = 0
    @State var opacity: Double = 1.0
    var opacity2: Double {
        show ? max(1 - Double(dragOffset) / 100, 0) : min(Double(dragOffset) / 2000, 1)
    }
    var body: some View {
        GeometryReader { geo in
            VStack{
                Group{
                    ZStack(alignment:.leading){
                        ImageView(dragOffset: dragOffset, show: show, geo: geo.size)
                        textview(dragOffset: dragOffset, show: show, geo: geo.size, opacity: opacity)
                    }
                }
                .padding( .top ,show ?  geo.size.height / 2 - 300  - dragOffset / 8 : 10 + dragOffset / 10)
                .padding(.leading, show ? 0 : max (10 - dragOffset  , 10))
                Spacer()
                ControlBarView()
                    .opacity(opacity2)
                    .offset(y: 50)
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
           
        }
        .frame(maxWidth: .infinity,maxHeight: show ? .infinity : 70 + dragOffset)
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: show ? max(40 - dragOffset / 10 ,12): min(12 + dragOffset / 10 , 40)))
        .offset(y: show ? dragOffset : 0)
        .gesture(
            DragGesture()
                .onChanged { value in
                    let dragChange = value.translation.height / 2
                    lastDragPosition = value.translation.height
                    if show{
                        withAnimation(.smooth) {
                            dragOffset = dragChange * 2 // * 2 to make it faster
                            dragOffset = max(0,dragOffset)
                        }
                        
                    }else{
                        dragOffset -= dragChange
                        dragOffset = max(0, dragOffset)
                    }
                    opacity = max(1 - Double(dragOffset) / 100 , 0)
                }
                .onEnded { _ in
                    lastDragPosition = 0
                    if show && dragOffset > 50{
                        withAnimation(.smooth) {
                            show = false
                        }
                    }else if !show && dragOffset > 50{
                        withAnimation(.smooth) {
                            show = true
                        }
                    }
                    withAnimation(.spring) {
                        dragOffset = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        opacity = 1
                    }
                }
        )
        .animation(.spring, value: show)
        .frame(maxHeight: .infinity,alignment: .bottom)
        .padding(show ? min(dragOffset / 20 , 30) : 30 - min(dragOffset / 20, 30))
        .ignoresSafeArea()
    }
}

#Preview {
    MusicView()
}
struct ImageView: View {
    var dragOffset: CGFloat
    var show: Bool
    var geo: CGSize
    var body: some View {
        Image(.im).resizable().scaledToFill()
            .frame(
                width: show ? max(250 - dragOffset / 4, 50) : min(50 + dragOffset / 4, 250),
                height: show ? max(250 - dragOffset / 4 , 50) : min(50 + dragOffset / 4 , 250))
            .clipShape(.rect(cornerRadius: 12))
            .padding(.trailing, show ? 0 + dragOffset / 3 : max(geo.width - dragOffset / 2 , geo.width / 10))
    }
}
struct textview: View {
    var dragOffset: CGFloat
    var show: Bool
    var geo: CGSize
    var opacity: Double
    var body: some View {
        HStack{
            Text("The Song Name")
                .font( show ? .title : .callout).bold()
                .offset(y: show ? 180 : 0)
                .offset(x:  show ? 0 : dragOffset / 5)
                .padding(.leading, show ? 0 : 65)
                .opacity(opacity)
                .animation(.none, value: show)
        }
    }
}

 

// just ui
struct ControlBarView: View {
    var body: some View {
        VStack(spacing:64) {
            ZStack(alignment:.leading){
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray)
                    .frame(height: 8)
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black)
                    .frame(width: 90,height: 8)
                    .overlay(alignment: .trailing) {
                        Circle()
                            .fill(.white)
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }
                   
            }
 
            .padding(.horizontal,44)
            HStack(spacing: 40) {
                Image(systemName: "shuffle")
                Image(systemName: "backward.fill")
                Image(systemName: "play.fill")
                    .font(.system(size: 28))
                Image(systemName: "forward.fill")
                Image(systemName: "rectangle.expand.vertical")
            }
            .font(.title2)
            .padding(.top, 20)
        }
    }
}
