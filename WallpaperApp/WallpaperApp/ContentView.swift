
import SwiftUI
import SDWebImageSwiftUI
import Photos
import Firebase
struct ContentView: View {
    @EnvironmentObject var vm:DataManager
    @State private var showAllImages1: Bool = false
    @State private var showAllImages2: Bool = false
    var body: some View {
        ZStack{
            ZStack{
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Category 1")
                            Spacer()
                            Button {
                                showAllImages1 = true
                            } label: {
                                Text("View All")
                            }

                        }
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(vm.imageUrls.prefix(3),id: \.self) { url in
                                    Button {
                                        vm.selectedImage = url
                                    } label: {
                                        WebImage(url: URL(string: url))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 280, height: 170)
                                            .cornerRadius(15)
                                    }
                                   
                                     
                                }
                            }
                        }
                        HStack{
                            Text("Category 2")
                            Spacer()
                            Button {
                                showAllImages2 = true
                            } label: {
                                Text("View All")
                            }

                        }
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(vm.imageUrlsT.prefix(3),id: \.self) { url in
                                    Button {
                                        vm.selectedImage = url
                                    } label: {
                                        ImageViewUrl(url: url)
                                    }

                                    
                                         
                                }
                            }
                        }
                        HStack{
                            Text("Category 2")
                            Spacer()
                            Button {
                                showAllImages1 = true
                            } label: {
                                Text("View All")
                            }

                        }
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(vm.imageUrls.prefix(3),id: \.self) { url in
                                    Button {
                                        vm.selectedImage = url
                                    } label: {
                                        ImageViewUrl(url: url)
                                    }
                                }
                            }
                        }
                        
                    }
                }
                .onAppear{
                    vm.loadImages(name:"images") { url in
                        vm.imageUrls.append(url)
                    }
                    vm.loadImages(name:"imagesTow") { url in
                        vm.imageUrlsT.append(url)
                    }
                }
                .padding(.top)
                .padding(.horizontal,5)
                .fullScreenCover(isPresented: $showAllImages1) {
                    ViewAllImages(images: vm.imageUrls)
                        .environmentObject(vm)
                }
                .fullScreenCover(isPresented: $showAllImages2) {
                    ViewAllImages(images: vm.imageUrlsT)
                        .environmentObject(vm)
                }
                if vm.selectedImage != nil{
                    TheImageView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataManager())
    }
}
struct ImageViewUrl: View {
    let url:String
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .scaledToFill()
            .frame(width: 160, height: 350)
            .cornerRadius(10)
    }
}
