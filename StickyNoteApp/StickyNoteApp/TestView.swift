 
import SwiftUI
struct dataModel:Identifiable{
    var id = UUID()
    var name:String
    var position:CGPoint
}
struct TestView: View {
    @State var isDraggingOverTrash = false
    @State var vmItem:[dataModel] = []
    var body: some View {
        ZStack{
            ForEach(vmItem) { item in
                ZStack{
                    Image(.frame1)
                    Text(item.name)
                }
                .position(item.position)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.linear) {
                                if let index = vmItem.firstIndex(where: {$0.id == item.id}){
                                    vmItem[index].position = value.location
                                }
                                isDraggingOverTrash = (30...130).contains(value.location.x) && (300...450).contains(value.location.y)
                            }
                           
                        }
                        .onEnded{ value in
                            if isDraggingOverTrash{
                                vmItem.removeAll{$0.id == item.id}
                            }
                            isDraggingOverTrash = false
                        }
                )
            }
            
            
            Button {
                vmItem.append(dataModel(name: "the new", position: CGPointMake(100, 100)))
            } label: {
                Text("Add one").font(.largeTitle)
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
            Image(systemName: isDraggingOverTrash ? "trash.fill" : "trash")
                .foregroundStyle(.white)
                .padding()
                .background(isDraggingOverTrash ? .pink : .black,in:Circle())
                .opacity(isDraggingOverTrash ? 0.7 : 1)
                .scaleEffect(isDraggingOverTrash ? 1.3 : 1)
                .position(x: 45, y: 375)
                .animation(.spring, value: isDraggingOverTrash)
            
        }
        
      
    }
}

#Preview {
    TestView()
}
