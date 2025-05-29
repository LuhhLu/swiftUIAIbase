 

import SwiftUI

struct HomeView: View {
    let ListOne: [DataModel] = [
        DataModel(iconName: "text.bubble.fill", title: "Broadcast Lists", destination: AnyView(test())),
        DataModel(iconName: "star.fill", title: "Broadcast Lists View", destination: AnyView(Text("Destination 2"))),
        DataModel(iconName: "link", title: "Starred Messages", destination: AnyView(Text("Destination 3"))),
        DataModel(iconName: "key.fill", title: "Starred View", destination: AnyView(Text("Destination 4")))
        
        
      ]
    
    let ListOne2: [DataModel] = [
        DataModel(iconName: "key.fill", title: "Account", destination: AnyView(Text("heee2"))),
        DataModel(iconName: "hand.raised.fill", title: "Privacy", destination: AnyView(Text("Destination 22"))),
        DataModel(iconName: "bell.fill", title: "Notifications", destination: AnyView(Text("Destination 32"))),
        DataModel(iconName: "link", title: "Starred Messages", destination: AnyView(Text("Destination 3"))),
        DataModel(iconName: "key.fill", title: "Starred View", destination: AnyView(Text("Destination 4")))
      ]
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing:30){
                    DropMenu(icon: "message.badge.waveform", title: "Messages", color: .BG_2, ListOne: ListOne,listH: 300)
                    DropMenu(icon: "gearshape", title: "Settings", color: .BG, ListOne: ListOne2,listH: 300)
                    Spacer()
                }
            }
              
        }
         
            
        
            
             
           
        
       
        
    }
}

#Preview {
    HomeView()
}
