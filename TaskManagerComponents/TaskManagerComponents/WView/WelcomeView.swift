 

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack(alignment:.bottom){
            Color.BG
            GeometryReader { Geometry in
                Image(.W).resizable().scaledToFill()
                    .frame(width: Geometry.size.width, height: Geometry.size.height / 1.7)
                
            }
            VStack(spacing:50){
                Text("Great Project Management Tool for Teams")
                    .font(.system(size: 54).bold())
                    .foregroundStyle(.black)
                Button {
                    //
                } label: {
                    Text("Get Started")
                        .font(.title.bold())
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .background(.indigo,in:.capsule)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "arrow.forward")
                                .font(.title2.bold())
                                .foregroundStyle(.black)
                                .padding(16)
                                .background(.yellow,in:.circle)
                                .padding(.trailing,3)
                        }
                }
                .tint(.white)
                .padding(.horizontal)

            }
            .padding()
            .padding(.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
