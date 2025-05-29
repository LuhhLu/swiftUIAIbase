
import SwiftUI
import SDWebImageSwiftUI
struct ViewAllImages: View {
    var colums:[GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    @EnvironmentObject var vm:DataManager
    @Environment(\.dismiss) var dismis
    let images:[String]
    var body: some View {
        ZStack{
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: colums) {
                    ForEach(images,id: \.self) { url in
                       
                        Button {
                            vm.selectedImage = url
                        } label: {
                            ImageViewUrl(url: url)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 190, height: 350)
                                .cornerRadius(10)
                        }

                        
                             
                    }
                   
                }
                .offset(y: 50)
               
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    dismis()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(6)
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .offset(x: -10, y: -5)

            }
            .padding(.horizontal,15)
            if vm.selectedImage != nil{
                TheImageView()
            }
        }
    }
}

struct ViewAllImages_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllImages( images: ["",""])
            .environmentObject(DataManager())
    }
}

//
//
//import SwiftUI
//import SDWebImageSwiftUI
//struct ViewAllImages: View {
//    var colums:[GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
//    @EnvironmentObject var vm:DataManager
//    @Environment(\.dismiss) var dismis
//    let images:[String]
//    var body: some View {
//        ZStack{
//            ScrollView(.vertical,showsIndicators: false){
//                LazyVGrid(columns: colums) {
//                    ForEach(images,id: \.self) { url in
//                        WebImage(url: URL(string: url))
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 170, height: 350)
//                            .cornerRadius(10)
//                            .onTapGesture {
//                                vm.selectedImage = url
//                            }
//                    }
//                    .offset(y: 50)
//                }
//
//
//            }
//            .overlay(alignment: .topTrailing) {
//                Button {
//                    dismis()
//                } label: {
//                    Image(systemName: "xmark")
//                        .font(.title3)
//                        .foregroundColor(.white.opacity(0.7))
//                        .padding(6)
//                        .background(Color.black.opacity(0.7))
//                        .clipShape(Circle())
//                }
//                .offset(x: -10, y: -5)
//
//            }
//            .padding(.horizontal,15)
//            if vm.selectedImage != nil{
//                TheImageView()
//            }
//        }
//    }
//}
//
//struct ViewAllImages_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewAllImages( images: ["",""])
//            .environmentObject(DataManager())
//    }
//}
