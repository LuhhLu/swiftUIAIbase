

import SwiftUI

struct ContentView: View {
//    Download pictures from https://www.vecteezy.com/free-vector/3d?license-free=true
    var images = ["m1","m2","m3","m4","m5"]
    var body: some View {
        TabView {
            ForEach(images,id: \.self) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global ).minX
                    ZStack(alignment: .bottom){
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .frame(height: 300)
                        VStack(alignment: .leading,spacing: 7){
                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .frame(width: 100, height: 20)

                                .padding(.bottom,10)
                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .frame(width: 230, height: 10)

                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .frame(width: 130, height: 10)

                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .frame(width: 180, height: 10)
                        }
                        .foregroundColor(.white)
                        .offset(x: -20, y: -30)
                    }
                    .overlay(content: {
                        Image(item)
                            .resizable()
                            .offset(x: minX / 2)
                            .offset(x: 45, y: -100)
                    })
                    .padding(.vertical,60)
                    .padding(.horizontal,40)
                    .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                    .shadow(color: .blue.opacity(0.2), radius: 10, x: 0, y: 10)
                }
               
            }
            
        }
        .frame(height: 480)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
