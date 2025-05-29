

import SwiftUI
struct Item: Identifiable {
    var id = UUID()
    var title: String
}
struct ContentView: View {
    var items: [Item] = [
        Item(title: "Apple"),
        Item(title: "Banana"),
        Item(title: "Cherry"),
        Item(title: "Date"),
        Item(title: "Elderberry"),
        Item(title: "Fig"),
        Item(title: "Grape"),
        Item(title: "Honeydew"),
        Item(title: "Iceberg Lettuce"),
        Item(title: "Jackfruit"),
        Item(title: "Kiwi"),
        Item(title: "Lime"),
        Item(title: "Mango"),
        Item(title: "Nectarine"),
        Item(title: "Orange"),
    ]
    @State private var searchText = ""
    var body: some View {
        ZStack{
            Color("C1")
            VStack(spacing: 0){
                customSearchbar(searchText: $searchText)
                    .padding(.trailing,5)
                ScrollView{
                    VStack(spacing: 0){
                        ForEach(items.filter{$0.title.lowercased().contains(searchText.lowercased())}) { item in
                            Text(item.title)
                                .padding(.leading)
                                .foregroundColor(.white)
                                .frame(height: 60)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .background(Color("C2"))
                            
                        }
                    }
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding()
                   
                }
                Spacer()
            }
            .padding(.top,60)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
