 

import SwiftUI

struct ExplorStyle: View {
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea()
            Button {} label: {}
                .buttonStyle(CapsuleButtonStyle(title: "Explore",iconName: "arrow.right",BGColor: .green))
            .padding()
        }
      
    }
}

#Preview {
    ExplorStyle()
}
struct CapsuleButtonStyle: ButtonStyle {
    var title: String
    var iconName: String
    var BGColor: Color
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            Text(title).font(.title).foregroundStyle(.white)
            ZStack {
                Circle().fill(Color.white)
                .frame(width: 34, height: 34)

                Image(systemName: iconName).resizable().scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 15).padding(.vertical, 10)
        .background( Capsule().fill(BGColor) )
        .overlay( Capsule().stroke(Color.white, lineWidth: 2) )
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .animation(.smooth, value: configuration.isPressed )
    }
}


struct CapsuleButtonStyle2: ButtonStyle {
    var title: String
    var iconName: String
    var BGColor: Color
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            Text(title).font(.title).foregroundStyle(.black)
            ZStack {
                Circle().fill(Color.white)
                .frame(width: 34, height: 34)

                Image(systemName: iconName).resizable().scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 15).padding(.vertical, 10)
        .background( Capsule().fill(.white) )
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .animation(.smooth, value: configuration.isPressed )
    }
}
 
