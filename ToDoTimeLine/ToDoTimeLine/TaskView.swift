 
import SwiftUI

struct TaskView: View {
    var items:TDModel
    var body: some View {
        HStack{
            Image(systemName: items.isComplete ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(items.isComplete ? .green : .gray)
                .frame(maxHeight: .infinity,alignment: .top)
                .font(.title2)
            VStack(alignment:.leading){
                HStack{
                    Text(items.title).font(.title2)
                        .strikethrough(items.isComplete)
                    Spacer()
                    Image(systemName: "pencil")
                        .frame(width: 28, height: 28)
                        .background(.thinMaterial,in: Circle())
                        .offset(x: 5, y: -5)
                }
                Text(items.detalis)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .background(.thinMaterial,in:.rect(cornerRadius: 12))
            .animation(.none, value: items.isComplete)
            Spacer()
        }
    }
}

#Preview {
    TaskView(items:  TDModel(title: "Complete SwiftUI Tutorial", detalis: "Follow the latest SwiftUI tutorial to enhance your UI building skills and explore new features."))
}
