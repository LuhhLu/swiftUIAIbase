    import SwiftUI

    struct HomeView: View {
        @State private var selection: ContentViewSelection = .home
        @State private var dragging: CGSize = .zero
        @State private var position: CGSize = .zero
        @State private var scale: CGFloat = 1.0
        @State private var show = false
        @State var sideshow = false
        var addedItems = AddedItems()
        @Namespace var namespace
        var body: some View {
                ZStack{
                    switch selection {
                             case .home:
                                 ContentViewWrapper(dragging: dragging, position: position, scale: scale) {
                                     ContentView(addedItems: addedItems,show: $show)
                                 }
                             case .favorite:
                        ContentViewWrapper(dragging: dragging, position: position, scale: scale) {
                            Text("Purchase View")
                        }
                             case .purchase:
                        ContentViewWrapper(dragging: dragging, position: position, scale: scale) {
                            newone(addedItems: addedItems)
                        }
                             case .trash:
                                 ContentViewWrapper(dragging: dragging, position: position, scale: scale) {
                                     Text("Trash View")
                                 }
                             }
                    SideView(selection: $selection)
                        .offset(x: -220)
                        .offset(x:max( min(dragging.width + position.width ,220),0) )
                        .opacity(sideshow ? 1 : 0)
                   
                }
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        sideshow.toggle()
                    }
                   
                })
                .onChange(of: selection, { oldValue, newValue in
                    withAnimation {
                        dragging.width = .zero
                        position.width = .zero
                        scale = 1.0
                    }
                    
                })
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.linear) {
                            if position.width == 0 && value.translation.width < 0 {
                                self.dragging = .zero
                            } else {
                                self.dragging = value.translation
                                let adjustment = position.width == 220 ? 0 : (value.translation.width / 625)
                                self.scale = position.width + value.translation.width >= 220 ? 0.9 : max(1 - abs(adjustment), 0.9)
                            }
                        }
                    }
                    .onEnded { value in
                            withAnimation(.linear)  {
                                if value.translation.width >= 50 {
                                    self.position.width += (value.translation.width > 0) ? 220 : -220
                                } else {
                                    self.position.width = 0
                                    self.scale = 1.0
                                }
                                self.dragging = .zero
                            }
                        
                        
                       
                    }
        )
                    .ignoresSafeArea()
                    .onChange(of: show) { oldValue, newValue in
                        withAnimation {
                            if show{
                                dragging.width = 220
                                position.width = 220
                                scale = 0.9
                            }else{
                                dragging.width = 0
                                position.width = 0
                                scale = 1
                            }
                           
                        }
                        
                }
     
    }
        
}


#Preview {
    HomeView()
}

struct ContentViewWrapper<Content: View>: View {
    var content: Content
    var dragging: CGSize
    var position: CGSize
    var scale: CGFloat

    init(dragging: CGSize, position: CGSize, scale: CGFloat, @ViewBuilder content: () -> Content) {
        self.dragging = dragging
        self.position = position
        self.scale = scale
        self.content = content()
    }

    var body: some View {
        content
            .mask(
                RoundedRectangle(
                    cornerRadius: min(dragging.width + position.width / 5, 50),
                    style: .continuous
                )
            )
            .scaleEffect(scale)
            .offset(x: max(min(dragging.width + position.width, 220), 0))
    }
}



 
