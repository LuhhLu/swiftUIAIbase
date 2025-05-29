
import SwiftUI

struct ContentView: View {
    @State var icon = "checklist"  
    @State var viewmodel = DataModel()
    @State var showIconPicker = false
    var body: some View {
        VStack(spacing:16) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title)
                    .frame(width: 55, height: 55)
                    .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
                    .onTapGesture {
                        showIconPicker = true
                    }
                TextField("New task", text: $viewmodel.searchText,axis: .vertical)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
                
                    .onChange(of: viewmodel.searchText) {_ , _ in
                        if let matchedIcon = viewmodel.iconFilter.first {
                            icon = matchedIcon
                            if !viewmodel.inputIcons.contains(matchedIcon) {
                                viewmodel.inputIcons.append(matchedIcon)
                            }
                        } else {
                            icon = "checklist"
                        }
                    }
            }
          
            .sheet(isPresented: $showIconPicker) {
                IconPickerStyle(viewmodel: viewmodel, selectedIcon: $icon, color: .constant(false) )
            }
            
            HStack{
                Image(systemName: "calendar.badge.clock") // 📅 Meeting Icon
                Text("Have a meeting")
                Spacer()
            }
            .padding(.leading)
            .frame(height: 55)
            .background(.gray.opacity(0.3), in: .rect(cornerRadius: 12))

            HStack{
                Image(systemName: "cart.fill") // 🛒 Shopping Icon
                Text("Go grocery shopping")
                Spacer()
            }
            .padding(.leading)
            .frame(height: 55)
            .background(.gray.opacity(0.3), in: .rect(cornerRadius: 12))

            Button {
                //
            } label: {
                Text("Save") .font(.title2.bold())
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
            }
            .tint(.primary)

        }
        .padding()
    }
}
#Preview {
    ContentView()
}
