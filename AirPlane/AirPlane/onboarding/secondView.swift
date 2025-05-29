//
//  secondView.swift
//  AirPlane
//
//  Created by youssef on 2023-05-30.
//

import SwiftUI

struct secondView: View {
    @State var animate = false
    var body: some View {
        ZStack{
           Rectangle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("topC"),Color("botC")]), startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
//            Download pictures from https://www.vecteezy.com/free-vector/3d-travel?license-free=true
            Image("m2")
                .resizable()
                .scaledToFit()
                .offset(x: animate ? 0 :400)
                .onAnimation(speed: 0.4, damping: 8,animate: animate)
            VStack(alignment: .leading){
                Text("Explore The World With us.").bold()
                    .font(.system(size: 60))
                Spacer()
            }
            .foregroundColor(.white)
            .offset(x: animate ? 0 : 300)
            .onAnimation(speed: 0.7, damping: 10,animate: animate)
            .padding(.top)
        }
        
        .onAppear{
            animate.toggle()
        }
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
