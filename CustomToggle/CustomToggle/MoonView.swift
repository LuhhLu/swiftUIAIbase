 

import SwiftUI

struct MoonView: View {
    var body: some View {
        Circle()
            .frame(width: 40, height: 40)
            .foregroundColor(Color("moonc"))
            .overlay(alignment: .leading) {
                ZStack{
                    HStack(spacing: 12){
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 9, height: 9)
                            .foregroundColor(.black)
                            .background(Color("mooncs"))
                            .clipShape(Circle())
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                            .background(Color("mooncs"))
                            .clipShape(Circle())
                    }
                    .padding(.leading,3)
                    .rotationEffect(.degrees(-15))
                    VStack(spacing: 15){
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 9, height: 9)
                            .foregroundColor(.black)
                            .background(Color("mooncs"))
                            .clipShape(Circle())
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 7, height: 7)
                            .foregroundColor(.black)
                            .background(Color("mooncs"))
                            .clipShape(Circle())
                            .offset(x: 5)
                    }
                    .rotationEffect(.degrees(-15))
                   
                }
               
                
                
            }
    }
}

struct MoonView_Previews: PreviewProvider {
    static var previews: some View {
        MoonView()
    }
}
