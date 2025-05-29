 

import SwiftUI

struct FeedBackView: View {
    @State var selected: ImageResource? = nil
    @State var open = false
    @State var showButtons = false
    @State var showsend = false
    @FocusState var FocusState
    @Binding var text:String
    var SenAction:() -> Void
    var body: some View {
        VStack(alignment: open ? .leading : .center,spacing: 17) {
            Text("FeedBack").font(.title2).bold()
                .foregroundStyle(.white)
            if open{
                RateExperience
                StateSelection(selected: $selected)
                    .frame(maxWidth: .infinity,alignment: .center)
                TextEditorView
            }

        }
        .padding()
        .frame(maxWidth: .infinity,alignment:  open ? .topLeading : .center)
        .frame(height: open ? 350 : 60 , alignment: open ? .topLeading : .center)
        .background(.bg,in: .rect(cornerRadius:  open ? 20 : 10))
        .clipped()
        .padding()
        .onTapGesture {
            withAnimation {
                open = true
            }
            if !open{
                showButtons = false
            }else{
                withAnimation(.spring.delay(0.3)) {
                    showButtons = true
                }
            }
            
        }
        .background(
            SendAndCansel(send: $showsend, Cancel: {
                selected = nil
                text = ""
                withAnimation {
                    open = false
                    showButtons = false
                }
            }, Send: {
                SenAction()
            })
            .offset(y: showButtons ? 250 : 0)
        )
        .onChange(of: selected ) { oldValue, newValue in
            withAnimation {
                showsend = newValue != nil
                
            }
          
        }
        .onChange(of: text) { oldValue, newValue in
            withAnimation {
                showsend = newValue != ""
            }
          
        }
 
        
    }
    
    var RateExperience:some View{
        VStack(alignment:.leading,spacing: 8){
            Text("Rate Experience")
                .font(.title2)
            Text("How do you feel about using our app, please rate your experience.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.white)
    }
    var TextEditorView:some View{
        TextEditor(text: $text)
            .focused($FocusState)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        FocusState = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down.fill")
                    }
                }
            }
            .clipShape(.rect(cornerRadius: 10))
    }
}

//#Preview {
//    FeedBackView()
//}
