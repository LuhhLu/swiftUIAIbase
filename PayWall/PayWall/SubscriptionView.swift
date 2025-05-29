 
import SwiftUI

struct Subscription: Identifiable {
    var id = UUID()
    var type: String
    var details: String
    var price: String
}
struct SubscriptionView: View {
    var subscription: Subscription
    var isSelected: Bool
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0) {
                Text(NSLocalizedString(subscription.type, comment: ""))
                    .font(.system(size: 13).bold())
                    .foregroundStyle(.black)
                    .frame(width: 75, height: 25)
                    .background(.white,in:.rect(cornerRadius: 8))
                Spacer()
                Text(NSLocalizedString(subscription.details, comment: ""))
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .offset(y: -2)
                
            }
            Spacer()
            VStack(alignment: .trailing) {
                Image(systemName: isSelected ? "inset.filled.circle" : "circle")
                    .contentTransition(.symbolEffect)
                    .font(.system(size: 20))
                Spacer()
                Text(NSLocalizedString(subscription.price, comment: ""))
                    .font(.system(size: 18).bold())
            }
            .foregroundStyle(.white)
        }
        .frame(height: 55)
        .padding(10)
        .background(.BG,in:.rect(cornerRadius: 12))
    }
}


#Preview {
    SubscriptionView(
        subscription: Subscription(
            type: "Monthly",
            details: "Get 3 days free trial",
            price: "$34.99"
        ),
        isSelected: false
    )
}

