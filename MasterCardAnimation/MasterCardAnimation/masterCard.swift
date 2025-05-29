import SwiftUI

struct masterCard: View {
    var color:Color
    var body: some View {

            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 320, height: 200)
                    .offset(x: -2, y: 2)
                    .foregroundStyle(.black)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 320, height: 200)
                    .foregroundStyle(color) 
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 0.5)
                    .frame(width: 320, height: 200)
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading,spacing: 15){
                            HStack{
                                Text("8097 8954 6352 5632").bold()
                                    .font(.title2)
                                Spacer()
                                Image(systemName:"esim")
                                    .rotationEffect(.degrees(90))
                                    .font(.title)
                            }
                            .padding()
                            
                            HStack{
                                Text("Card").bold()
                                    .font(.title2)
                                Image(systemName: "globe").font(.title2)
                                    
                                Spacer()
                                Image("mas")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 20)
                                    .offset(y: -3)
                                    
                            }
                            .padding()
                        }
                        
                    }
                
                
            }
            .foregroundStyle(.white)
 
    }
}
#Preview {
    masterCard(color: .red)
}
