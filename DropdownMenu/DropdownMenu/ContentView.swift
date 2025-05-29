 




struct DropMenu: Identifiable {
  var id = UUID()
  var title: String
}
let drop = [
   DropMenu(title: "Item1" ),
   DropMenu(title: "Item2"),
   DropMenu(title: "Item3" ),
   DropMenu(title: "Item4"),
   DropMenu(title: "Item5" ),
   DropMenu(title: "Item6")
]
import SwiftUI
struct ContentView: View {
    @State var show = true
    @State var name = "Item1"
    var body: some View {
        
        VStack {
            ZStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                    ScrollView{
                        VStack(spacing: 17){
                            ForEach(drop) { item in
                                Button {
                                    withAnimation {
                                        name = item.title
                                        show.toggle()
                                    }
                                } label: {
                                    Text(item.title).foregroundColor(.white.opacity(0.6))
                                        .bold()
                                    Spacer()
                                }

                            }
                            .padding(.horizontal)
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.vertical,15)
                    }
                }
                .frame(height: show ? 200 : 50)
                .offset(y:  show ? 0 : -135)
            .foregroundColor(Color("D2"))
             
                
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10).frame(height: 60)
                        .foregroundColor(Color("D1"))
                    HStack{
                        Text(name).font(.title2)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(show ? -90 : 0))
                    }
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                }
                .offset(y: -133)
                .onTapGesture {
                    withAnimation {
                        show .toggle()
                    }
                }
            }
            
        }
        .padding()
        .frame(height: 280).offset(y: 40)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
