import SwiftUI

struct AutoSlidingPageView: View {
    @State private var currentPage = 0
    let images = ["portrait", "ctshirt", "Jacket","Wtshirt"]
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count,id:\.self) { index in
                    ZStack(alignment: .leading) {
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .clipShape(.rect(cornerRadius: 24))
                            .overlay(alignment: .topLeading) {
                                VStack(spacing:-5){
                                    Text("50").font(.title.bold())
                                    Text("% OFF")
                                        .font(.system(size: 10))
                                }
                                .foregroundStyle(.white)
                                .background(
                                    Image(systemName: "seal.fill")
                                        .font(.system(size: 55))
                                        .foregroundStyle(.red)
                                    
                                )
                                .padding()
                            }
                        
                        
                        
                    }
                    .padding(.horizontal,50)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .frame(height: 180)
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % images.count
                }
            }
            HStack(spacing: 8) {
                ForEach(0..<images.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(index == currentPage ?  .primary :  Color.gray.opacity(0.5))
                        .frame(width:index == currentPage ? 25 : 8, height: 8)
                }
            }
        }
    
    }
}

#Preview {
    AutoSlidingPageView()
}
