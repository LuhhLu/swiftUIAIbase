import SwiftUI

struct SubmitFeedbackView: View {
    @State var feedbackText: String = ""
    var  action: () -> Void
    var body: some View {
        VStack(spacing: 54) {
      TextEditor(text: $feedbackText)
                .padding(.leading,14)
                .padding(.top,5)
                .frame(height: 150)
                .scrollContentBackground(.hidden)
                .background(.sheetBG,in:.rect(cornerRadius: 16))
                .overlay(alignment: .topLeading) {
                    Group{
                        if feedbackText.isEmpty{
                            Text("What is the problem ?")
                                .foregroundStyle(.secondary)
                                .padding(.leading,17)
                                .padding(.top,14)
                                
                        }
                    }
                }
            
            Button {
                action()
                feedbackText = ""
            } label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundStyle(.LD)
                    .background(.primary)
                    .clipShape(Capsule())
            }
            .tint(.primary)

        }
        .padding()
    }
}


#Preview {
    SubmitFeedbackView(action: {})
}
