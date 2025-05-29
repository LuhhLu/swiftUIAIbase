import SwiftUI

struct SpotifyWaveView: View {
    @State var animate = false
    @State var heights: [CGFloat] = [40, 40, 40, 40]
    var body: some View {
        HStack {
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    ForEach(0..<heights.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 4, height: heights[index])
                            .offset(x: CGFloat(index) * 10 + 10)
                            .animation(.easeInOut(duration: 0.4), value: heights[index])
                            .foregroundStyle(.green)
                    }
                }
                .onAppear {
                    animate = true
                    animateBars()
                }
            }
            .frame(width: 40, height: 60)
            .offset(x: -25,y:-6)
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray.opacity(0.3))
            VStack(alignment:.leading){
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 200, height: 20)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 100, height: 15)
            }
            .foregroundStyle(.gray.opacity(0.3))
        }
        .padding(10)
        .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
    }
    
    func animateBars() {
        guard animate else { return }
        withAnimation {
            heights = heights.map { _ in
                CGFloat.random(in: 5...50)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            animateBars()
        }
    }
}

 
#Preview {
    SpotifyWaveView()
}
