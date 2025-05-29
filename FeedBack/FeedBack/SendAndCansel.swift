 
import SwiftUI

struct SendAndCansel: View {
    @Binding var send:Bool
    var Cancel:() -> Void
    var Send:() -> Void
    var body: some View {
        HStack(spacing:send ? 10 : 0){
            CancelButton(send: $send, Cancel: {Cancel()})
            sendButton(send: $send, Send: {Send() })
        }
            .padding()
    }
}

#Preview {
    SendAndCansel(send: .constant(false), Cancel: {}, Send: {})
}
struct CancelButton: View {
    @Binding var send:Bool
    var Cancel:() -> Void
    var body: some View {
        Button {
            Cancel()
        } label: {
        Image(systemName: "xmark")
                .font(.title2)
                .frame(maxWidth: send ? 60 : .infinity)
                .frame(height: 60)
                .background(.bg,in: .rect(cornerRadius: 15))
        }
        .tint(.white)

    }
}

 
struct sendButton: View {
    @Binding var send:Bool
    var Send:() -> Void
    var body: some View {
        Button(action: {
            Send()
        }, label: {
            Text("Submit").font(.title2)
                .foregroundStyle(.white)
                .frame(maxWidth: send ? .infinity : 0)
                .frame(height: 60)
                .background(.c1,in: .rect(cornerRadius: 15))
            
        })
    }
}

 
