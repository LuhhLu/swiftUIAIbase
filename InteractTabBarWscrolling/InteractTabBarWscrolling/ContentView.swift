import SwiftUI
struct ContentView: View {
    @Binding var TBOffset: CGFloat
    @State private var lastScrollY: CGFloat = 0
    var images1 = ["im1","im2","im3","im4","im5","im6","im7","im8","im9","im10","im11","im12" ]
    var images2 =  ["im13","im14","im15","im16","im17","im18","im19","im20","im21","im22","im23","im24" ]
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                Color.clear
                    .onChange(of: geo.frame(in: .global).minY) { oldValue, newYD in
                        if newYD < lastScrollY {
                            TBOffset = 180
                        }else if newYD > lastScrollY{
                            TBOffset = 0
                        }
                        lastScrollY = newYD
                    }
            }
            ScrollView {
                HStack(spacing:0) {
                   ImageGridView(images: images1, startIndex: 0)
                    ImageGridView(images: images2, startIndex: 1)
                }
                .padding(.horizontal,3)
            }
        }
    }
}

#Preview {
    ContentView(TBOffset: .constant(0))
}

struct ImageGridView: View {
    var images: [String]
    var startIndex: Int
    func getHeight(for index:Int) -> CGFloat{
        return (index + startIndex) % 2 == 0 ? 150 : 300
    }
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible())], content: {
            ForEach(images.indices ,id: \.self) { index in
                Image(images[index]).resizable().scaledToFill()
                    .frame(width: 187, height: getHeight(for: index))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        })
    }
}

 
