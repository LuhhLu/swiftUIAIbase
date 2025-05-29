 

import SwiftUI

struct HomeView: View {
    @State var data: [DataModel] = [
        DataModel(title: "SwiftUI", content: AnyView(
            Text("SwiftUI is the best way to build apps across Apple platforms. Discover new capabilities to customize the look and feel of your apps, as well as improved.")
            
        )),
        DataModel(title: "Rectangle Example", content: AnyView(
            HStack {
                RoundedRectangle(cornerRadius: 12).frame(height: 150)
                RoundedRectangle(cornerRadius: 12).frame(height: 150)
            }
            .foregroundStyle(.gray.opacity(0.2))
        )),
        DataModel(title: "UIKit framework", content: AnyView(Text("UIKit provides a variety of features for building apps, including components you can use to construct the core infrastructure of your iOS, iPadOS, or tvOS apps."))),
        DataModel(title: "Final Example", content: AnyView(Text("Try selecting different sections!")))
    ]


    var body: some View {
        VStack {
            ForEach(data) { item in
                ExSoneView(vm: item)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
