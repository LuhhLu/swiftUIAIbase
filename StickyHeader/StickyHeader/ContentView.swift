 

import SwiftUI

struct ContentView: View {
    var body: some View {
            ScrollView {
                VStack {
                    imageview()
                    GeometryReader { geo in
                        let minY = geo.frame(in: .global).minY
                        HStack(spacing:10){
                            Button(action: {}, label: {
                                Label("message", systemImage: "message")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(width: 260, height: 45)
                                    .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 30))
                            })
                            
                            Cbutton(iconname: .in, action: {})
                            Cbutton(iconname: .x, action: {})
                        }
                        .frame(maxWidth: .infinity)
                        .offset(y: max(60 - minY , 0))
                    }
                    .offset(y: -44)
                    .zIndex(1)
                    GridView()
                }
            }
            .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
}
@ViewBuilder
func imageview() -> some View{
    GeometryReader{ geo in
        let minY = geo.frame(in: .global).minY
        let iscrolling = minY > 0
        VStack{
            Image(.im1).resizable().scaledToFill()
                .frame(height:iscrolling ? 180 + minY : 180)
                .clipped()
                .offset(y: iscrolling ? -minY : 0)
                .blur(radius: iscrolling ? 0 + minY / 80 : 0)
                .scaleEffect(iscrolling ? 1 + minY / 2000 : 1)
                .overlay(alignment: .bottom) {
                    ZStack{
                        Image(.im2).resizable().scaledToFill()
                        Circle().stroke(lineWidth: 6)
                    }
                    .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .offset(y: 50)
                        .offset(y: iscrolling ? -minY : 0)
                }
            Group{
                VStack(spacing:6){
                    Text("SUCODEE") .bold().font(.title)
                    Text("I started learning Swiftui a year and a half ago, and I loved it very much. I like sharing what I learned on YouTube, and Thank you ❤️.").font(.callout)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width - 30)
                        .lineLimit(3)
                        .fixedSize()
                }
                .offset(y: iscrolling ? -minY : 0)
            }
            .padding(.vertical,53)
            
        }
       

    }
    .frame(height: 395)
   
}
struct GridView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
            ForEach(0 ..< 25) { item in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 220)
                    .foregroundStyle(.ultraThinMaterial)
            }
        })
        .padding(.horizontal,10)
    }
}
struct Cbutton: View {
    let iconname:UIImage
    var action :()-> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(uiImage: iconname).resizable().scaledToFill()
                .frame(width: 23, height: 23)
                .padding(10)
                .background(.ultraThinMaterial,in: Circle())
                .overlay {
                    Circle().stroke(lineWidth: 1)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.gray]), startPoint: .bottomLeading, endPoint: .topTrailing))
                }
        }

    }
}

 
