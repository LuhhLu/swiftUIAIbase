 
import SwiftUI

struct AddNewNoteView: View {
    @Environment(\.colorScheme) var isDark
    @State var vm:Model
    @Binding var show:Bool
    @State var selected = "Frame1"
    @FocusState var istyping:Bool
    @State var title = ""
    @State var title2 =  "  Quek Note"
    var cards:[String] = ["Frame1","Frame2","Frame3","Frame4","Frame5","Frame6"]
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        show = false
                    }
                }
            VStack(spacing:40){
                TextEditor(text:istyping ? $title : $title2)
                    .focused($istyping)
                    .font(.custom("PatrickHand-Regular", size: 24))
                    .frame(height: 70)
                    .foregroundStyle(title.count >= 60 ? .red : .primary)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(alignment: .bottomTrailing) {
                        Text("\(title.count) / 60")
                            .foregroundStyle(title.count >= 60 ? .red : .white)
                            .offset(y: 33)
                    }
                HStack(spacing:19){
                    ForEach(cards,id:\.self){ item in
                        Image(item).resizable().scaledToFill()
                            .frame(width: 40, height: 40)
                            .scaleEffect(selected == item ? 1.5 : 1)
                            .animation(.spring, value: selected)
                            .onTapGesture {
                                selected = item
                            }
                        
                    }
                }
                Button(action: {
                    withAnimation {
                        vm.notes.append(NoteModel(id:UUID(),card: selected, note: title, positaion: CGPoint(x: 200, y: 200)))
                        title = ""
                        show = false
                        vm.tasks += 1
                        
                        
                    }
                    
                }, label: {
                    Text("Save").bold()
                        .frame(height: 40)
                        .foregroundStyle(isDark == .dark ? .white : .black)
                        .frame(maxWidth: .infinity)
                        .background(isDark == .dark ? .black : .white,in: .rect(cornerRadius: 10))
                })
                
            }
            .padding(.horizontal,10)
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .background(isDark == .dark ? .addnote : .bg,in:.rect(cornerRadius: 20))
            .padding()
        .frame(maxHeight: .infinity,alignment: .bottom)
        }
    }
}

#Preview {
    AddNewNoteView(vm: Model(), show: .constant(false))
}
