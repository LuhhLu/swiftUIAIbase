 
import SwiftUI

struct ContentView: View {
    let images: [String] = [
        "im1", "im2", "im3", "im4", "im5", "im6", "im7", "im8", "im9", "im10",
    ]
    let images2: [String] = [
        "im19", "im20","im21", "im22", "im23", "im24", "im25", "im26", "im27"
    ]
    
    @State var show = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            // I know we can use LazyVGrid with 2 rows, but the animation will be different

            HStack{
                ImageRow(images: images)
                ImageRow(images: images2)
            }
            .offset(y: show ? -4000 : 2000)
            .onAppear(){
                withAnimation (.linear(duration: 9)){
                    show.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ImageRow: View {
    var images:[String]
    var body: some View {
        VStack(spacing:50){
            ForEach(0..<images.count, id:\.self){index in
                let scale = CGFloat.random(in: 0.5...1)
                Image(images[index]).resizable().scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 16))
                    .scaleEffect(scale)
                    .blur(radius: randomBlur())
                    .rotationEffect(Bool.random() ? .degrees(Double.random(in: -10...10)): .degrees(0))
                    .offset(alternatingRandomOffset(index: index))
            }
        }
    }
    private func alternatingRandomOffset(index: Int) -> CGSize {
        let randomX = CGFloat.random(in: 10...120) * (index % 2 == 0 ? -1 : 1)
        let randomY = CGFloat.random(in: 0...80) * (Bool.random() ? 1 : -1)
        return CGSize(width: randomX, height: randomY)
    }
    private func randomBlur() -> CGFloat {
        //only 3 images have blure
        return Int.random(in: 1...images.count) <= 3 ? 5 : 0
    }
}

 
