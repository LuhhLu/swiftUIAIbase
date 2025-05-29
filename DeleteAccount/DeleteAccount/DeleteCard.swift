 

import SwiftUI

struct DeleteCard: View {
    var icon:String
    var title:String
    var details:String
    var BStartTitle:String
    var BEndTitle:String
    @Binding var show:Bool
    @State var trimEnd: CGFloat = 0.0
    var body: some View {
        VStack(spacing:20) {
            VStack(spacing:28){
                Image(systemName: icon)
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
                VStack(spacing:16){
                    Text(title).font(.title2.bold())
                    Text(details)
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                HoldButton(BStartTitle: BStartTitle, BEndTitle:BEndTitle, trimEnd: $trimEnd)
            }
            .padding(.horizontal)
            .frame(width: 350, height: 316)
            .background(.BG,in: .rect(cornerRadius: 30))
            .overlay {
                ReclineLine(trimEnd: $trimEnd)
            }
            Button(action: {
                withAnimation {
                    show = false
                }
              
            }, label: {
                Text("Cancel").font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.BG,in: .rect(cornerRadius: 15))
                    .padding(.horizontal,22)
            })
            .tint(.white)
          
        }
         
    }
}

#Preview {
    DeleteCard(icon:  "trash.circle", title: "Delete Account", details: "Are you sure you want to delete your account? All your data will be permanently removed.",BStartTitle: "ACCOUNT DELETED", BEndTitle: "HOLD TO DELETE", show: .constant(false))
}
struct HoldButton: View {
    var BStartTitle:String
    var BEndTitle:String
    @State var isComplete = false
    @State var isSuccess = false
    @Binding var trimEnd: CGFloat
    var body: some View {
        VStack{
            ZStack{
                ZStack(alignment:.leading){
                    Rectangle()
                        .foregroundStyle(.red.opacity(0.5))
                    Rectangle()
                        .frame(maxWidth: isComplete ? .infinity : 0)
                        .foregroundStyle(isSuccess ? .DB : .red)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .clipShape(.rect(cornerRadius: 15))
                .padding(.horizontal,8)
                Text(isSuccess ? "ACCOUNT DELETED" : "HOLD TO DELETE").bold()
                    .foregroundStyle(.white)
                
            }
            .onLongPressGesture(minimumDuration: 2, maximumDistance: 50) { isPressing in
                if isPressing{
                    withAnimation (.linear(duration: 2)){
                        isComplete = true
                        trimEnd = 1
                    }
                }else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                        if !isSuccess {
                            withAnimation {
                                isComplete = false
                                trimEnd = 0
                            }
                        }
                    }
                }
                
            }perform:{
                withAnimation {
                 isSuccess = true
                    trimEnd = 1
                }
                
            }
            
        }
    }
}

struct ReclineLine: View {
    @Binding var trimEnd: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .trim(from: 0.5 - trimEnd / 2, to: 0.5 + trimEnd / 2)
            .stroke(lineWidth: 1)
            .frame(width: 313, height: 347)
            .foregroundStyle(.red)
            .rotationEffect(.degrees(90))
    }
}

 
