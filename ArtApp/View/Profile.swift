 
import SwiftUI

struct Profile: View {
    let columns :[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var datam : PostModel
    var body: some View {
        ScrollView{
 
            VStack(spacing: 20){
                Image(datam.avtar)
                    .resizable()
                    .scaledToFill()
                     
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                VStack{
                    HStack{
                        Text(datam.by).bold()
                            .font(.title)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .offset(y:3)
                    }
                    
                }
 
                HStack(spacing: 80){
                    info(postcount: "34", titel: "Posts")
                    info(postcount: "154k", titel: "Followers")
                    info(postcount: "02", titel: "Following")
                }
                Divider()
                LazyVGrid(columns: columns){
                    ForEach(MacData.gallery){ items in
                        Image(items.imagename)
                            .resizable()
                            .scaledToFill()
                            
                            .frame(width: 115, height: 150)
                            .cornerRadius(20)
                    }
                }
            }
            .padding()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(datam: MacData.psimple)
    }
}
struct info : View{
    var postcount = ""
    var titel = ""
    var body: some View{
        VStack{
            Text(postcount)
                .font(.headline)
            Text(titel)
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}
