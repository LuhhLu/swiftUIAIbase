import SwiftUI

struct ContentView: View {
    let features = [
        Feature(icon: "bell.fill", color: .orange, title: "Unlimited Tasks", description: "Set reminders and alerts to never miss a deadline"),
        Feature(icon: "checkmark", color: .green, title: "Reminders & Alerts", description: "Create unlimited tasks without any restrictions"),
        Feature(icon: "star.fill", color: .yellow, title: "Task Prioritization", description: "Prioritize tasks to focus on what matters most"),
        Feature(icon: "cloud.fill", color: .blue, title: "Cloud Sync", description: "Sync your tasks across all devices seamlessly"),
        Feature(icon: "moon.fill", color: .purple, title: "Dark Mode", description: "Enjoy a beautiful dark mode experience")
    ]
    let subscriptions = [
           Subscription(type: NSLocalizedString("Monthly", comment: ""), details: "Get 3 days free trial", price: "$34.99"),
           Subscription(type: "Annually", details: "$20.83/month. Billed annually", price: "$249.00")
       ]
    @State private var selectedSubscriptionID: UUID?
    var body: some View {
        let locale = Locale.current.language.languageCode!.identifier
        let spacing: CGFloat = {
             switch locale {
             case "es","ja": return 32
             default:   return 64
             }
         }()
        
        
        VStack(spacing:spacing){
            VStack(spacing:24){
                ForEach(features) { feature in
                    FeatureView(feature: feature)
                }
            }
            
            VStack(spacing:24){
                ForEach(subscriptions) { subscription in
                    SubscriptionView(subscription: subscription, isSelected: selectedSubscriptionID == subscription.id)
                        .onTapGesture {
                            selectedSubscriptionID = subscription.id
                        }
                }
                
                
                Button {
                    //
                } label: {
                    Text("Subscribe")
                        .font(.title2.bold())
                        .foregroundStyle(.BT)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(.BG_2,in:.rect(cornerRadius: 12))
                }
                .padding(.top,10)
                Text("Automatic payment, can be cancelled at any time\nTerms of Service and Privacy Policy")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: true, vertical: true)
                                .padding(.top, 10)

            }
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
