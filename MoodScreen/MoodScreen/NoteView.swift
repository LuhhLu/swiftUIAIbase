 
import SwiftUI

struct NoteView: View {
    @State var open = false
    @State var text = "type.."
    @Binding var scrollToBottom:Bool
    var body: some View {
        VStack(spacing:0) {
          
            Text("Note Mood").font(.title2.bold())
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity,alignment: open ? .topLeading : .center)
            if open {
                TextEditor(text: $text).padding(10)
                    .scrollContentBackground(.hidden)
                    .frame(height: 100)
                    .background(.gray.opacity(0.3),in:.rect(cornerRadius: 8))
                    .padding()
            }
        }
        .overlay(alignment: .topTrailing) {
            Button(action: {
                withAnimation {
                    open = false
                }
            }, label: {
                Image(systemName: "xmark.circle.fill").font(.title2)
                    .padding().opacity(open ? 1 : 0)
                    .animation(.none, value: open)
            })
            .tint(.white)
        }
        .frame(height: open ? 190 : 55)
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
        .clipped()
        .onTapGesture {
            withAnimation {
                if !open{
                    open.toggle()
                    scrollToBottom .toggle()
                }
            }
        }
        
    }
}

#Preview {
    NoteView(scrollToBottom: .constant(false))
}
