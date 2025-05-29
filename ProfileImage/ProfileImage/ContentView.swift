 
import SwiftUI
import PhotosUI
struct ContentView: View {
    @State var show = false
    @State var selectedItem: PhotosPickerItem? = nil
    @State var profileImage: UIImage? = nil
    @State var showPicker = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                VStack {
                    ZStack(alignment:show ? .leading : .center){
                        if let profileImage = profileImage{
                            ProfileImageView(show: $show, profileImage: profileImage)
                        }else{
                            EmptyImage(showPicker: $showPicker, show: $show)
                        }
                        nameView(show: $show)
                    }
                  
                }
                .ignoresSafeArea()
                HStack(spacing:16){
                    ConnectButton(title: "Message", icon: "message", action: {})
                    CButton(icon: .in, action: {})
                    CButton(icon: .x, action: {})
                }
                .padding(.top,47)
                .padding(.horizontal,24)
            }
            .frame(maxHeight: .infinity,alignment: .top)
        }
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                showPicker.toggle()
            }, label: {
                Image(systemName: "photo")
                    .frame(width: 23, height: 23)
                    .padding(10)
                    .background(.IB, in: .circle)
                    .foregroundColor(.white)
                    .padding(.trailing,24)
            })
        })
        .photosPicker(isPresented: $showPicker, selection: $selectedItem,matching: .images)
        .onChange(of: selectedItem) { oldValue, newValue in
            Task{
                if let data = try? await newValue?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data){
                    profileImage = uiImage
                }
            }
        }
       
    }
}

#Preview {
    ContentView()
}
 
struct EmptyImage: View {
    @Binding var showPicker:Bool
    @Binding var show:Bool
    var body: some View {
        Image(systemName: "person.fill")
            .frame(width: 110, height: 110)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .background(.IB,in: Circle())
            .padding(.top, show ? 0 : 100)
            .onTapGesture {
                showPicker.toggle()
            }
        
    }
}
struct ProfileImageView: View {
    @Binding var show : Bool
    var profileImage: UIImage
    var body: some View {
        GeometryReader(content: { geo in
            Image(uiImage: profileImage).resizable().scaledToFill()
            .frame(width:show ? geo.size.width : 110, height: show ? 320 : 110)
            .clipShape(.rect(cornerRadius: show ? 0 : 100))
            .padding(.top , show ? 0 : 100)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    show.toggle()
                }
            
            }
            
        })
        .frame(maxWidth: show ? .infinity : 110,maxHeight: show ? 240 : 210)
    }
}
struct nameView: View {
    @Binding var show:Bool
    var body: some View {
        VStack{
            Text("Sucodee").bold()
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("SwiftUI Developer")
                .foregroundStyle(show ? .white : .gray)
            
        }
        .offset(y: show ? 155 : 159)
        .padding(.leading,show ? 24 : 0)
    }
}
struct ConnectButton: View {
    var title:String
    var icon:String
    var action:() -> Void
    var body: some View {
        Button(action: {action()}, label: {
            Label(title, systemImage: icon)
                .font(.title3).bold()
                .foregroundStyle(.black)
                .frame(height: 45).frame(maxWidth: .infinity)
                .background(.white,in:.rect(cornerRadius: 30))
        })
    }
}

struct CButton: View {
    var icon:ImageResource
    var action:() -> Void
    var body: some View {
        Button(action: {action()}, label: {
            Image(icon).resizable()
                .scaledToFill()
                .frame(width: 23, height: 23)
                .padding(10)
                .background(.IB,in: Circle())
                .overlay {
                    Circle().stroke(lineWidth: 1)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.gray]), startPoint: .bottomLeading, endPoint: .topTrailing))
                }
               
        })
    }
}

 

 
