 
import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @State var ShowaddView  = false
    @Query var note :[Note]
    @Binding var showside :Bool
    var body: some View {
        VStack(spacing:0){
                HederView(showSide: $showside)
                List {
                    ForEach(note) { note in
                       noteCell(note: note)
                        .onTapGesture {
                            NoteToglle(note: note)
                        }
                     
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            
                            Button(action: {
                                withAnimation {
                                    deleteNote(noteToDelete: note)
                                }
                               
                            }, label: {
                                Image(.trash)
                                    
                            })

                        }
                     
                        .tint(.clear)
                      
                    }
                    .listRowSeparator(.hidden)
                    .ignoresSafeArea()
                }
                .listRowSpacing(-8)
                .listStyle(.inset)
                .safeAreaPadding(.top,10)

            }
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                ShowaddView.toggle()
            }, label: {
                Image(systemName: "plus").font(.title)
                    .padding(20)
                    .background(.ultraThinMaterial,in:Circle())
            })
            .tint(.primary)
            .padding(.trailing)
        }
        .sheet(isPresented: $ShowaddView, content: {
            NewNoteView()
                .presentationDetents([.fraction(0.40)])
        })
        
    }

    func deleteNote(noteToDelete: Note) {
        context.delete(noteToDelete)
        do {
            try context.save()
        } catch {
            print("Error deleting note: \(error.localizedDescription)")
        }
    }
    func NoteToglle(note : Note){
        note.isComplet.toggle()
        do {
            try context.save()
        } catch {
            print("Error saving todo status change: \(error.localizedDescription)")
        }
    }
}
#Preview {
    ContentView(showside: .constant(false))
        .modelContainer(for: [Note.self])
}
struct HederView: View {
    @Binding var showSide :Bool
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            SideBarIconA(show: $showSide)
            Text("Notes").font(.largeTitle).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
        .padding(.top)
        
    }
}

struct noteCell: View {
    var note:Note
    var body: some View {
        HStack{
            Image(systemName: note.icon)
                .renderingMode(note.iconColor ? .original : .template)
                .font(.title2)
                .frame(width: 40,alignment: .leading)
            Text(note.title)
                .strikethrough(note.isComplet, color: .primary)
            Spacer()
            Image(systemName:note.isComplet ? "checkmark.circle.fill" : "circle")
                
              
        }
        .padding()
        .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
        
    }
}

 
