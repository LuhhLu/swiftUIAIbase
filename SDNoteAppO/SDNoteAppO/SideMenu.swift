import SwiftUI
 
import SwiftUI

struct SideMenu: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Note App").font(.title)
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            .padding(10)
            .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 10))
            .frame(width: 188)
            Spacer()
        }
        .padding(.top, 30)
        .padding(.leading)
        .frame(maxWidth: 220, maxHeight: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SideMenu()
       
}
 
