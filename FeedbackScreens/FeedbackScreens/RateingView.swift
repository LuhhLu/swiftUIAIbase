
import SwiftUI

// Define a custom enum to represent two possible types of feedback.
// Conforming to `String` means each case has a raw string value, e.g., FeedbackType.like.rawValue == "like".
enum FeedbackType: String {
    case like
    case dislike
}
struct RateingView: View {
    // A state variable to track which feedback type the user has selected.
    // It's optional, so it can be `.like`, `.dislike`, or `nil` (no selection yet).
    @State var selectedFeedback: FeedbackType?
    @State var showDoneView = false
    @State var showSendTipView = false
    var body: some View {
        ZStack {
            VStack( spacing: 44) {
                VStack( spacing: 26) {
                    Image(.im).resizable().scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(.circle)
                    Text("How was sara service ?")
                        .font(.system(size: 30)).bold()
                    HStack(spacing:40){
                        FeedbackButton(isSelected: selectedFeedback == .dislike, action: {selectedFeedback = .dislike})
                            .rotationEffect(.degrees(180))
                        
                        FeedbackButton(isSelected: selectedFeedback == .like, action: {selectedFeedback = .like})
    
                    }
                }
                switch selectedFeedback {
                case .like:
                    TipView {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                            selectedFeedback  = nil
                        }
                        withAnimation {
                            showSendTipView.toggle()
                        }
                    }
                     .transition(.offset(y: 500))
                  
                case .dislike:
                    SubmitFeedbackView {
   
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                            selectedFeedback  = nil
                        }
                        withAnimation {
                            showDoneView.toggle()
                        }
                    }
                    .transition(.offset(y: 600))
                case nil:
                    EmptyView()
                }
            }
            .animation(.spring, value: selectedFeedback)
            Group{
                if showDoneView{
                    DoneView(action: {
                        withAnimation {
                            showDoneView.toggle()
                        }
                    })
                    .transition(.offset(y: 1000))
                }
                if showSendTipView{
                    SendTip {
                        withAnimation {
                            showSendTipView.toggle()
                        }
                    }
                    .transition(.offset(y: 1000))
                }
            }
            .zIndex(1)
            // and last thing make sure to add Zindex to this view because when we dismiss this view will go behind everything on the screen so we need to make sure this view be always on top any view
        
            
        }
    }
}

#Preview {
    RateingView()
}
struct FeedbackButton: View {
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName:"hand.thumbsup.fill")
                .resizable().scaledToFit()
                .symbolEffect(.bounce,options: .repeat(1), value: isSelected)
                .padding()
                .frame(width: 64, height: 64)
                .background(isSelected ? Color.primary : .gray.opacity(0.3),in:.circle)
                .foregroundStyle(isSelected ? .LD : .DL)
        }

       
        
    }
}
