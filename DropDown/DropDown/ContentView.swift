 
import SwiftUI

struct ContentView: View {
    @State var isDropdownopen = false
    var body: some View {
        VStack {
            ForEach(items) { item in
                HStack{
                    Image(systemName: item.icon)
                        .padding(10)
                        .background(.ultraThinMaterial,in:Circle())
                    Text(item.title).bold()
                        .font(.title3)
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
                .padding(.horizontal)
                .frame(width: isDropdownopen ? 300 : 300 - CGFloat((items.count - 1 - items.firstIndex(where: {$0.id == item.id})!) * 13), height: 70)
                .background(Color("c"))
                .cornerRadius(5)
                .offset(y: isDropdownopen ? 0 : CGFloat(-70 * items.firstIndex(where: { $0.id == item.id })!))
                .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: -3)
                
               
           
            }
            
            
        }
        .onTapGesture {
            withAnimation (.interactiveSpring(response: 0.8, dampingFraction: 0.6)){
                isDropdownopen.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DataItem: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
}
let items: [DataItem] = [
    DataItem(icon: "person.fill", title: "Edit Profile"),
    DataItem(icon: "gearshape.fill", title: "Setting & Privacy"),
    DataItem(icon: "questionmark.circle.fill", title: "Help & Support"),
    DataItem(icon: "moon.fill", title: "Display&Accessiblity")
]
