



import SwiftUI

struct ShareView: View {
    @Binding   var showShareView :Bool
    @State var copylink = false
    var link = "https://www.patreon.com/sucodee"
    var link2 = "https://www.youtube.com/channel/UC9YE4KZX3z89F0LkDRXjpJg"
    var body: some View {
        VStack{
            Button(action: {
                withAnimation {
                    showShareView.toggle()
                }
               
            }, label: {
                Image(systemName: "arrow.left").font(.title2)
                    .padding(10)
                    .background(.gray.opacity(0.15),in:Circle())
                    .frame(maxWidth: .infinity,alignment: .leading)
            })
            .tint(.black)
            Spacer()
            Group{
                Text("Invite your friends\nto discover the app").bold().font(.largeTitle)
                Text("Your moments stay yours alone. Opt to share with family, gaining insight into their lives as well—sharing is optional")
                    .frame(width: 300)
            }
            
                .frame(maxWidth: .infinity,alignment: .leading)
            ContentView()
                .frame(height: 300)
            HStack(spacing:14){
                Button(action: {
//                    UIPasteboard.general.string = link
                    withAnimation {
                        copylink.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        withAnimation {
                            copylink.toggle()
                        }
                    }
                }, label: {
                    VStack{
                        Image(systemName: "doc.on.doc").font(.title)
                        Text("Copy link")
                            .font(.custom("BradleyHandITCTT-Bold", size: 20))
                    }
                    .frame(width: 160, height: 140)
                    .background(.gray.opacity(0.15),in:RoundedRectangle(cornerRadius: 30))
                    
                })
                
                ShareLink(item: URL(string: link)  ??  URL(string: link2)!){
                    VStack(spacing:20){
                        Image(systemName: "square.and.arrow.up").font(.title)
                        Text("Share")
                            .font(.custom("BradleyHandITCTT-Bold", size: 20))
                    }
                    .frame(width: 160, height: 140)
                    .background(.gray.opacity(0.15),in:RoundedRectangle(cornerRadius: 30))
                }
            }
            .tint(.primary)
            Spacer()
            Button(action: {
                withAnimation {
                    showShareView.toggle()
                }
            }, label: {
                Text("Maybe later").font(.system(size: 25)).opacity(0.5)
            })
            .tint(.primary)
        }
        .overlay(alignment: .bottom, content: {
            Text("Link Copied :)").bold().font(.headline)
                .frame(width: 150, height: 50)
                .background(.white,in:RoundedRectangle(cornerRadius: 30))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                .offset(y: copylink ? 0 : 100)
        })
        
        .padding(.horizontal,30)
    }
}

#Preview {
    ShareView(showShareView: .constant(false))
}
