 

import SwiftUI

struct TabBarView: View {
    let items: [TabBarItem] = [
        .init(title: "Profile", image: Image(systemName: "person.fill")),
        .init(title: "For You", image: Image(systemName: "medal.fill")),
        .init(title: "People", image: Image(systemName: "lines.measurement.vertical")),
        .init(title: "Liked You", image: Image(systemName: "heart.fill")),
        .init(title: "Chats", image: Image(systemName: "message.fill"))
        
    ]
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(items, id: \.title) { item in
                VStack {
                    item.image
                        .bold()
                        .imageScale(.large)
                        .padding(.bottom, 4)
                    
                    Text(item.title)
                        .font(.caption)
                        .fontDesign(.rounded)
                        .fontWeight(.medium)
                }
                .foregroundStyle(item.title == "People" ? .darkGray : .lightGray)
                Spacer()
            }
        }
    }
}
