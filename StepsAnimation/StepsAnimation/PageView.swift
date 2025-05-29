import SwiftUI
struct DataModel:Identifiable{
    var id = UUID()
    var icon:String
    var title:String
    var details:String
    var tag:Int
}
struct PageView: View {
    let cardData = [
        DataModel(icon: "paintbrush.fill", title: "Brushes", details: "Explore various brushes for different effects.", tag: 0),
        DataModel(icon: "scribble", title: "Sketch", details: "Create quick sketches and doodles.", tag: 1),
        DataModel(icon: "square.and.pencil", title: "Shapes", details: "Draw and manipulate shapes with ease.", tag: 2),
        DataModel(icon: "paintpalette.fill", title: "Colors", details: "Choose from a wide range of colors and palettes.", tag: 3),
        DataModel(icon: "sparkles", title: "Effects", details: "Apply special effects to enhance your artwork.", tag: 4),
        DataModel(icon: "hand.draw.fill", title: "Freehand", details: "Draw freehand with precision and control.", tag: 5),
        DataModel(icon: "sparkles", title: "Effects", details: "Apply special effects to enhance your artwork.", tag: 6),
    ]
    @State var currentPage = 0
    @State var previousPage = 0
    @State var width: CGFloat = 16
    @State var start = false
    @State var iconAnimation = false
    @State var navigateToHome = false
    var body: some View {
        VStack{
            TabView(selection: $currentPage,content:  {
            ForEach(cardData) { items in
                CardView(vm: items)
            }
            
        })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: currentPage) { oldValue, newValue in
                handlePageChange(from: oldValue, to: newValue)
            }
            StepsView(currentPage: $currentPage, numberOfCircles: cardData.count, circleSize: circleSize, width: $width)
            ButtonsView(isLastPage: .constant(currentPage == cardData.count - 1), Start: $start, GoBack: {
                withAnimation {
                    if currentPage > 0 {
                         currentPage -= 1
                    }
                }
                
            }, next: {
                withAnimation {
                    if currentPage < cardData.count - 1 {
                        currentPage += 1
                    }else{
                        // go to home view
                    }
                }
                
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func handlePageChange(from oldValue: Int, to newValue: Int) {
        updateWidth(newValue)
        previousPage = newValue
    }
    func  updateWidth(_ newPage: Int) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
            if newPage == 0{
                start  = false
            }
            if newPage > previousPage{
                start = true
                width += 30.1
            }else{
                width -= 30.1
            }
        }
    }
    func circleSize(for index: Int, total: Int) -> CGFloat{
        let minCircleSize: CGFloat = 5
        if index < total / 2{
            return minCircleSize + CGFloat(index)
        }else{
            return minCircleSize + CGFloat(total - index - 1)
        }
      
    }
}

#Preview {
    PageView()
}
