

import SwiftUI
import Observation
struct NoteModel:Identifiable{
    var id = UUID()
    var card:String
    var note:String
    var positaion:CGPoint
}
@Observable class Model{
    var notes:[NoteModel] = []
    var completed = 0
    var tasks = 0
    var remaing = 0
}

struct BorderView: View {
    @State var Edit = false
    @State var vm = Model()
    @State var isDraggingOverTrash = false
    @Binding var show :Bool
    var body: some View {

        ZStack{
            ZStack{
                Image(.wgrid).resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity,maxHeight: .infinity).ignoresSafeArea()
                ForEach(vm.notes){ item in
                    ZStack{
                        Image(item.card).resizable().scaledToFill()
                            .frame(width: 170, height: 170)
                        Text(item.note)
                            .font(.custom("PatrickHand-Regular", size: 15))
                            .frame(width: 120, height: 80)
                            .foregroundStyle(.black)
                    }
                    .position(item.positaion)
                    .gesture(
                        DragGesture()
                        
                            .onChanged{ value in
                                
                                withAnimation(.linear) {
                                    if let index = vm.notes.firstIndex(where: {$0.id == item.id}){
                                        vm.notes[index].positaion = value.location
                                    }
                                    isDraggingOverTrash = (30...130).contains(value.location.x) &&
                                    (300...450).contains(value.location.y)
                                }
                            }
                            .onEnded{ value in
                                if Edit{
                                    if isDraggingOverTrash{
                                        vm.notes.removeAll{$0.id == item.id}
                                        vm.completed += 1
                                    }
                                    isDraggingOverTrash = false
                                }
                             
                            }
                    )
                }
                if Edit{
                    trashIcon
                }
            }
 
            GeometryReader(content: { geometry in
                AddNewNoteView(vm: vm, show: $show)
                    .offset(y: show ? -100 :geometry.size.height)
            })
             
     
           
            .overlay(alignment: .topTrailing) {
                Button {
                    Edit.toggle()
                } label: {
                    Image(systemName: "pencil.slash")
                        .padding(10)
                        .background(.black,in:Circle())
                        .foregroundStyle(.white)
                        .padding()
                }

            }
        }
        .onChange(of: vm.notes.count) { oldValue, newValue in
            if vm.notes.count == 0 {
                vm.tasks = 0
                vm.completed = 0
            }
        }
    }
    private var trashIcon: some View {
        Image(systemName: isDraggingOverTrash ? "trash.fill" : "trash")
            .foregroundColor(.white)
            .padding()
            .background(isDraggingOverTrash ? .pink : .black,in:Circle())
            .opacity(isDraggingOverTrash ? 0.7 : 1)
            .scaleEffect(isDraggingOverTrash ? 1.3 : 1)
            .frame(width: 50, height: 50)
            .position(x: 45, y: 375)
            .animation(.default, value: isDraggingOverTrash)
    }
}

#Preview {
//    BorderView(show: .constant(false))
    HomeView()
}
