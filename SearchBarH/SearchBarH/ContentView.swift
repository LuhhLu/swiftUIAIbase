




import SwiftUI

private let items = [
    ("Apple", Color.red),
    ("Banana", Color.yellow),
    ("Orange", Color.orange),
    ("Strawberry", Color.red),
    ("Grape", Color.purple),
    ("Lemon", Color.yellow),
    ("Watermelon", Color.green),
    ("Kiwi", Color.green),
    ("Peach", Color.orange),
    ("Blueberry", Color.blue)
]
struct ContentView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
              SearchBar(text: $searchText)
                ScrollView(.vertical,showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(items.filter({searchText.isEmpty ? true : $0.0.localizedCaseInsensitiveContains(searchText)}),id:\.0) { item in
                            HStack{
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(item.1)
                                HighlightedText(text: item.0, searchText: searchText)
                                    .font(.title)
                                    .padding(.leading)
                                Spacer()
                                
                            }
                            .padding()
                        }
                    }
                }
                .padding(.top)
            }
           
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
