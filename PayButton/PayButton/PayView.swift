
import SwiftUI
struct PayView: View {
    @State var pay = false
    @State var successful = false
    var body: some View {
        
        VStack(spacing:16){
            Spacer()
            SendInfo()
            ZStack{
                Capsule()
                    .frame(maxWidth: pay ? 55 : .infinity)
                    .frame(height: 55)
                    .foregroundStyle(successful ? .green : .primary)
                Text(successful ? "Payment successful" : "Confirm and send").bold()
                    .foregroundStyle(successful ? .white : .LD)
                    .scaleEffect(pay ? 0 : 1)
                loading()
                    .scaleEffect(pay ? 1 : 0)
            }
            .animation(.spring, value: pay)
            .onTapGesture {
                    pay = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            pay = false
                            successful = true
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    PayView()
}
