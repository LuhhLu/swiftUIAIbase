 

import SwiftUI
struct ItemsModel: Identifiable {
    var id = UUID()
    var imageName: String
}
struct OptionView: View {
    var imageName: SelsctImageManager
    var namespace: Namespace.ID
    @Binding var isOptionViewPresented :Bool
    var deleteAction: () -> Void
    var body: some View {
        VStack{
            Spacer()
            Image(imageName.selectedImage).resizable().scaledToFill()
                .frame(width: 220, height: 280)
                .clipShape(.rect(cornerRadius: 12))
                .matchedGeometryEffect(id: imageName.selectedImage, in: namespace)
            Spacer()
            VStack(spacing:55){
                options(icon: "square.and.arrow.up", title: "share", action: {})
                options(icon: "link", title: "Assign cards", action: {})
                options(icon: "plus.rectangle.on.rectangle", title: "Duplicate", action: {})
                options(icon: "trash", color: .red, title: "Delete", action:  { deleteAction() } )
                    .foregroundStyle(.red)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.thinMaterial)
        .overlay(alignment: .topTrailing) {
            Button {
                imageName.selectedImage = ""
                withAnimation (.spring(duration:0.25)){
                    isOptionViewPresented = false
                }
            } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .padding()
            }
            .tint(.primary)
        }
    }
}

//#Preview {
//    OptionView(imageName: SelsctImageManager(), isOptionViewPresented: .constant(false), deleteAction: {})
//}
struct options: View {
    var icon:String
    var color:Color = .secondary
    var title:String
    var action:() -> Void
    var body: some View {
        HStack(spacing:24){
            Image(systemName: icon).font(.title3)
                .frame(width: 30, height: 30)
                .foregroundStyle(color)
                .font(.title)
            Text(title).font(.title3)
            Spacer()
        }
        .onTapGesture {
            action()
        }
        .padding(.leading,24)
    }
}

 
