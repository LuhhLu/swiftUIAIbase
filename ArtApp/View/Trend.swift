 
import SwiftUI

struct Trend: View {
    var body: some View {
        trend(datam: MacData.tsimple)
    }
}

struct Trend_Previews: PreviewProvider {
    static var previews: some View {
        Trend()
    }
}
struct trend:View{
    var datam : TrendModel
    var body: some View{
        ZStack{
            Image(datam.image)
                .resizable()
                .scaledToFill()
                
                .frame(width: 275, height: 150)
                .cornerRadius(10)
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "heart")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(datam.count)
                        .font(.headline)
                }
                .padding(2)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
                
                .cornerRadius(10)
                Spacer()
                HStack{
                    Image(datam.avtar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                       
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .clipped()
                    Spacer()
                }
                
            }
           
            .frame(width: 265, height: 145)
        }
    }
}
