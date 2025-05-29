 
import SwiftUI

struct HomeView: View {
    @State private var selectedDocument: Document? = nil
    
    @State private var documents: [Document] = [
        Document(title: "Title #1"),
        Document(title: "Title #2"),
    ]
    enum TabSelection: Hashable {
        case home, search, tray, compose
    }
    @State private var selection: TabSelection = .home
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house",value: .home) {
                NavigationStack{
                    VStack{
                        profileRow
                            .padding(.horizontal,15)
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: .sectionHeaders) {
                                privateSection
                            }
                        }
                    }
                    .background(Color(.secondarySystemBackground))
                    .fullScreenCover(item: $selectedDocument) { document in
                        NavigationStack{
                            DocumentDetail(document: document)
                        }
                    }
                }
            }
            
            
            Tab("Search", systemImage: "magnifyingglass", value: .search) {}
            Tab("Tray", systemImage: "tray", value: .tray) {}
            Tab("Compose", systemImage: "square.and.pencil", value: .compose) {
             
                NewDocumentDetail{ newDocument in
                    if !newDocument.title.isEmpty && !newDocument.body.characters.isEmpty{
                        documents.append(newDocument)
                    }
                    selection = .home
                    
                }.id(UUID())
                
                
            }
            
        }
        .labelStyle(.iconOnly)
        .tint(.primary)
    }
    var profileRow:some View{
        HStack{
            Image(systemName:"s.square.fill")
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 0) {
                Text("SUCODEE")
                    .font(.headline)
                Text("Sucodee@gmail.com")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .padding(.trailing,15)
        }
      
    }
    var privateSection:some View{
        Section {
            VStack{
                ForEach(documents) { document in
                    Button {
                        self.selectedDocument = document
                    } label: {
                        DocumentRow(document: document)
                    }
                    .buttonStyle(.plain)

                }
            }
            .padding(.horizontal,15)
        }header: {
            HStack(spacing:10){
                Text("Private")
                Spacer()
                Image(systemName: "ellipsis")
                Image(systemName: "plus")
            }
            .font(.headline)
            .foregroundStyle(.secondary)
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            .background(Color(.secondarySystemBackground))
        }
    }
}

#Preview {
    HomeView()
}
