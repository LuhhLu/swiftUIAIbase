 
import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText = ""
    let names = ["John", "Jane", "Paul", "Jack", "Emma", "Sophie", "James", "Olivia"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
                List(filteredNames, id: \.self) { name in
                    Text(name)
                }
                .searchable(text: $searchText, placement: .automatic, prompt: "Search names...")
                .navigationTitle("Name Search")
        }
    }
}


#Preview {
    SearchBarView()
}

 
