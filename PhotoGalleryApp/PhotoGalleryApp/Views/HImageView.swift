 

import SwiftUI

struct HImageView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Popular").bold()
                .font(.title)
                .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 7){
                    ForEach(theimages3) { item in
                        Image(item.name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 200)
                        .cornerRadius(20)
                    }
                    pexelsview()
                }
                .padding(.leading)
            }
        }
        
    }
}

struct HImageView_Previews: PreviewProvider {
    static var previews: some View {
        HImageView()
    }
}
struct pexelsview: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(lineWidth: 1)
            .frame(width: 130, height: 200)
//            .padding(.leading)
            .overlay(alignment: .trailing) {
                VStack(alignment: .leading) {
                    Text("PEXELS").bold()
                        .font(.title)
                    Text("All photos and videos on Pexels are free to use.").bold()
                        .font(.system(size: 14))
                        .frame(width: 120)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    HStack{
                        Text("Try Now").bold()
                            .font(.title2)
                        Image(systemName: "arrow.right").bold()

                    }
                    
                }
                .padding(.leading,5)
                .padding(.vertical)
            }
    }
}

 
