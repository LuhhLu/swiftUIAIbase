
import SwiftUI

struct Post: View {
    var body: some View {
        post(datam: MacData.psimple)
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}

struct post: View{
    var datam : PostModel
    var body: some View{
        VStack(alignment: .leading){
            Image(datam.image)
                .resizable()
                .scaledToFill()
                .frame(width: 190, height: 130)
                .cornerRadius(20)
            VStack(alignment: .leading){
                Text(datam.titel).bold()
                    .font(.headline)
                    .minimumScaleFactor(0.9)
                HStack{
                    Text("by")
                        .font(.headline).foregroundColor(.gray)
                    Text(datam.by).foregroundColor(.white)
                    
                }
            }
            .padding(.horizontal,15)
            Spacer()
            
            
        }
        .frame(width: 170, height: 180)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}
