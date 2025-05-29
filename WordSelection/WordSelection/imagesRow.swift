

import SwiftUI

struct imagesRow: View {
    @State var move = false
    var row1 = ["m1","m2","m3"]
    var row2 = ["m4","m5","m6"]
    var body: some View {
        VStack{
            HStack{
                ForEach(row1,id:\.self) { item in
                    Image(item).resizable().scaledToFill()
                        .frame(width: 170, height: 120)
                        .clipShape(.rect(cornerRadius: 12))
                }
            }
            .offset(x: move ? 50 : -60)
            HStack{
                ForEach(row2,id:\.self) { item in
                    Image(item).resizable().scaledToFill()
                        .frame(width: 170, height: 120)
                        .clipShape(.rect(cornerRadius: 12))
                }
            }
            .offset(x: move ? -50 : 60)
        }
        .onAppear(){
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: true)) {
                move.toggle()
            }
        }
       
    }
}

#Preview {
    imagesRow()
}
