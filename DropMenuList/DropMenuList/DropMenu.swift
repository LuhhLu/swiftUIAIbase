 
import SwiftUI
struct DataModel {
    let iconName: String
    let title: String
    var destination: AnyView
}
struct DropMenu: View {

    var icon:String
    var title:String
    var color:Color
    var ListOne:[DataModel]
    var listH:CGFloat = 0
@State var showList = false
    var body: some View {
        VStack {
            ZStack {
                HStack{
                    Image(systemName: icon)
                        .frame(width: 30)
                    Text(title).font(.title2)
                    Spacer()
                    Image(systemName: "chevron.forward").font(.system(size: 15))
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(showList ? 90 : 0))
                }
                .bold()
                .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 53)
                        .background(
                            color,
                            in: RoundedRectangle(cornerRadius: 15)
                        )
                        .frame(height: showList ? 50 : 100)
                        .contentShape(Rectangle())
                        
                        .onTapGesture {
                            withAnimation {
                                showList.toggle()
                            }
                        }
                        .zIndex(1)
                
                
                ForEach(ListOne.indices,id: \.self) { item in
                    NavigationLink {
                        ListOne[item].destination
                    } label: {
                        HStack{
                            Image(systemName:ListOne[item].iconName).frame(width: 30)
                            Text(ListOne[item].title)
                            Spacer()
                            Image(systemName: "arrow.right")
                                
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(color.opacity(showList ? 1 : (1 - Double(item) * 0.3)),in:RoundedRectangle(cornerRadius: 15))
                       
                    }
                    .offset(y: showList ? CGFloat(item * 58) : CGFloat(item * 8))
                    .scaleEffect(showList ? 1 : (1 - Double(item) * 0.04))
                    .zIndex(CGFloat( item * -1))
                    
                  }
                .offset(y: showList ? 58 : 0)
            
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(height: showList ? listH : 70)
    }
}

//#Preview {
//    ContentView()
//}






 
