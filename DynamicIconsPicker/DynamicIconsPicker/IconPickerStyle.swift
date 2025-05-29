
import SwiftUI

struct IconPickerStyle: View {
    @Bindable var viewmodel: DataModel
    @Binding var selectedIcon: String
    @Binding var color: Bool
    @Environment(\.dismiss) var dismiss
    @State private var pickerSearchText: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                if !viewmodel.inputIcons.isEmpty {
                    VStack(alignment: .leading,spacing: 24) {
                        Text("Suggestions")
                            .font(.headline)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewmodel.inputIcons,id:\.self) { icon in
                                    Image(systemName: icon)
                                        .renderingMode(color ? .original : .template)
                                        .font(.system(size: 20))
//                                        .padding(10)
                                        .onTapGesture {
                                            selectedIcon = icon
                                            dismiss()
                                        }
                                }
                                .frame(width: 60, height: 60)
                                .background(.ultraThinMaterial,in:Circle())
                            }
                            
                        }
                        .scrollIndicators(.hidden)
                    }
                    .safeAreaPadding(.leading)
                }
                VStack(alignment: .leading) {
                    let filteredSections = viewmodel.filteredSections(searchText: pickerSearchText)
                    ForEach(filteredSections.keys.sorted(),id:\.self) { section in
                        Text(section)
                            .font(.headline)
                            .padding(.leading)
                            .padding(.top)
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 5)) {
                            ForEach(filteredSections[section] ?? [],id:\.self) { icon in
                                Image(systemName: icon)
                                    .renderingMode(color ? .original : .template)
                                    .font(.system(size: 20))
                                    .padding(10)
                                    .onTapGesture {
                                        selectedIcon = icon
                                        dismiss()
                                    }
                                    .frame(width: 60, height: 60)
                                    .background(.ultraThinMaterial,in:Circle())
                                
                            }
                        }
                    }
                }
                .searchable(text: $pickerSearchText)
                .safeAreaPadding()
            }
            .navigationTitle("Icons")
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    IconPickerStyle(viewmodel: DataModel(), selectedIcon: .constant(""), color: .constant(false))
}
