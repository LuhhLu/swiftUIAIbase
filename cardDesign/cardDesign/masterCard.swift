 

import SwiftUI

struct masterCard: View {
    var body: some View {
        ZStack{
            Color("cardb")
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 280, height: 180)
                    .foregroundColor(.black)
                    .offset(x: -2, y: 2)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 280, height: 180)
                    .foregroundColor(Color("card"))
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 0.5)
                    .frame(width: 280, height: 180)
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading,spacing: 15){
                            HStack{
                                Text("8097 8954 6352 5632").bold()
                                Spacer()
                                Image("sim")
                            }
                            .padding(8)
                            
                            HStack{
                                Text("Card").bold()
                                    .font(.title3)
                                Image(systemName: "globe").font(.title3)
                                    .foregroundColor(.black.opacity(0.7))
                                Spacer()
                                Image("mas")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 20)
                                    .offset(x: -5, y: -6)
                                    
                            }
                            .padding(8)
                        }
                        
                    }
                
                
            }
            .rotation3DEffect(.degrees(20), axis: (x: 10, y: 10, z: 0))
            .rotationEffect(.degrees(-10), anchor: .center)
            .offset(x: 10)
            
           
        }
        .ignoresSafeArea()
    }
}

struct masterCard_Previews: PreviewProvider {
    static var previews: some View {
        masterCard()
    }
}
