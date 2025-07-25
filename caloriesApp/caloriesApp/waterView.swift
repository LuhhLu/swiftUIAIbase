
import SwiftUI

struct waterView: View {
    @State var checkmark = true
    var body: some View {
        VStack {
            HStack {
                Text("6 of 6 classes").bold()
                    .font(.title3)
                    .offset(y:-10)
                Spacer()
                Image("cup")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 45)
            }
            .padding(.horizontal)
            HStack {
                ForEach(0 ..< 6) { item in
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue.opacity(checkmark ? 0.1 : 0.03))
                        HStack{
                            Image("water")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    checkmark.toggle()
                                }
                        }
                    }
                    .overlay(alignment: .topTrailing, content: {
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                            Image(systemName: checkmark ? "checkmark" : "").bold()
                                .font(.system(size: 10))
                                .foregroundColor(.green)
                        }
                    })
                  
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .modifier(customShadow())
    }
}

struct waterView_Previews: PreviewProvider {
    static var previews: some View {
        waterView()
    }
}
