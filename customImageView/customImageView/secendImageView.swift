 

import SwiftUI

struct secendImageView: View {
    func getHeight(_ index:Int) -> CGFloat{
        return index % 2 == 0 ? 150 : 300
    }
    func getHeight2(_ index:Int) -> CGFloat{
        return index % 2 == 0 ? 300 : 150
    }
    var images = ["m10", "m2", "m3", "m4", "m5", "m6"]
    var images2 = ["m7", "m4", "m9", "m10", "m11","m1"]
    var columns :[GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            HStack(spacing: 0){
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(images.indices,id: \.self) { item in
                        Image(images[item])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: getHeight(item))
                            .clipped()
                        .padding(.vertical,2)
                        
                    }
                }
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(images2.indices,id: \.self) { item in
                        Image(images2[item])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: getHeight2(item))
                            .clipped()
                        .padding(.vertical,2)
                        
                    }
                }
            }
         
        }
        .padding(.horizontal,10)
    }
}

struct secendImageView_Previews: PreviewProvider {
    static var previews: some View {
        secendImageView()
    }
}
