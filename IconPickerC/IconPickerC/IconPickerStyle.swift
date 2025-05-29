import SwiftUI

struct IconPickerStyle: View {
    @State var viewmodel = DataModel()
    @Binding var selectedIcon:String
    @Binding var color:Bool
     @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 5), content: {
                    ForEach(viewmodel.iconFilter,id:\.self) { icon in
                        Image(systemName: icon)
                            .renderingMode(color ? .original : .template)
                            .font(.title)
                            .padding(10)
                            .onTapGesture {
                                selectedIcon = icon
                                dismiss()
                            
                            }
                    }
                    .frame(width: 60, height: 60)
                    .background(.ultraThinMaterial,in:Circle())
                })
                .searchable(text: $viewmodel.searchText)
            }
            .navigationTitle("Icons")
            .padding(.horizontal,8)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    color.toggle()
                } label: {
                    Image(systemName: "lightspectrum.horizontal")
                        .renderingMode(color ? .template : .original)
                        .font(.system(size: 50)).bold()
                        .background(.black,in:Circle())
                    
                }
                .padding()
                .tint(.primary)

            }
             
        }
      
    }
}

//#Preview {
//    IconPickerStyle()
//}
