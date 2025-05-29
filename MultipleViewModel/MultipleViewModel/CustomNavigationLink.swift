 
import SwiftUI
struct CustomNavigationLink<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var title: String
    let content: Content
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                
                Image(systemName: "chevron.left").bold().foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(.ultraThinMaterial, in: Circle())
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title).font(.title)
                    
                }
            }
    }
}
