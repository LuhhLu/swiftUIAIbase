 



import SwiftUI
struct ImageInfo {
    let id: String
    let photographer: String
}
var imageInfos: [ImageInfo] = [
    ImageInfo(id: "m5", photographer: "Noor"),
    ImageInfo(id: "m8", photographer: "John"),
    ImageInfo(id: "m3", photographer: "Emma"),
    ImageInfo(id: "m1", photographer: "James"),
    ImageInfo(id: "m4", photographer: "Jane"),
    ImageInfo(id: "m6", photographer: "Alex")
]
struct ContentView: View {
    @State var selectedImage:ImageInfo? = nil
    @State var showNmae = false
    var body: some View {
        ScrollView {
            VStack {
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(imageInfos,id: \.id) { item in
                                Image(item.id)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: selectedImage?.id == item.id ? 300: 130, height: 220,alignment: .center)
                                .clipped()
                                .overlay(alignment: .bottomLeading, content: {
                                    Text(selectedImage?.id == item.id ? item.photographer : "")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .offset(x: showNmae ? 0 : -95)
                                        .clipped()
                                })
                                .onTapGesture {
                                    showNmae = false
                                    withAnimation {
                                        scrollView.scrollTo(item.id ,anchor: .center)
                                        selectedImage = item
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation {
                                            showNmae = true
                                        }
                                    }
                                    
                                   
                                }
                            }
                            Rectangle()
                                .stroke(lineWidth: 1)
                                .frame(width: 130, height: 220)
                                .padding(.trailing)
                                .overlay(alignment: .leading) {
                                    VStack(alignment: .leading){
                                        Text("PEXELS").bold()
                                            .font(.title)
                                        Text("All photos and videos on Pexels are free to use.").bold()
                                            .font(.system(size: 14))
                                            .frame(width: 120 )
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
                        .padding(.leading,14)
                    }
                }
                secendImageView()
                    
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
