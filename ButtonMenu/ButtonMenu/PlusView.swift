 



















import SwiftUI
struct PlusView: View {
    @State var show = false
    var body: some View {
        CircleView(show: $show)
            .overlay {
                ZStack{
                    if show{
                        VStack(alignment:.leading,spacing: 22.7){
                            ButtonMenu(icon: "camera.fill", title: "Camera", action: {
                                withAnimation {
                                    show.toggle()
                                }
                            })
                            ButtonMenu(icon: "photo.fill.on.rectangle.fill", title: "Photos", action: {})
                            ButtonMenu(icon: "location.fill", title: "Location", action: {})
                            ButtonMenu(icon: "person.fill", title: "Contact", action: {})
                        }
                        .foregroundStyle(.primary)
                    }else{
                        Image(systemName: "plus")
                            .foregroundStyle(.primary)
                            .padding(6)
                    }
                }

                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                .clipped()
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomLeading)
                .padding(30)
               
            }
        
    
       
    }
}

#Preview {
    PlusView()
}
struct ButtonMenu: View {
    var icon:String
    var title:String
    var action:() -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                Image(systemName: icon).font(.footnote)
                    .frame(width: 30, height: 30)
                    .background(.CBG,in: Circle())
                Text(title)
            }
        }
      

    }
}

 
