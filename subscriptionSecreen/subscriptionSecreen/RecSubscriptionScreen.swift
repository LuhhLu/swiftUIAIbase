 
import SwiftUI

struct RecSubscriptionScreen: View {
    @State var selectedSubscription:SubscriptionType = .monthly
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.buttom,.top]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack(spacing:32) {
                Spacer()
                Text("Unlock All Features").font(.largeTitle)
                    .foregroundStyle(.white)
                Spacer()
                FeaturesAnimation()
                Spacer()
                HStack(spacing:16){
                    Recsubscription(duration: "Free", price: "$0", details: "With Ads", isSelected: selectedSubscription == .free, action: {selectedSubscription = .free})
                    
                    Recsubscription(duration: "Monthly", price: "$4.99", details: "Billed Monthly", isSelected:selectedSubscription == .monthly , action: {selectedSubscription = .monthly})
                        .overlay(alignment: .topTrailing) {
                            likeView(icon: "hand.thumbsup.fill")
                                .offset(x:selectedSubscription == .monthly ? 16 : 10, y: selectedSubscription == .monthly ? -20 : -15)
                                .animation(.smooth, value: selectedSubscription)
                        }
                    
                    Recsubscription(duration: "Lifetime", price: "$99.99", details: "One-time payment", isSelected:selectedSubscription == .lifetime , action: {selectedSubscription = .lifetime})
                    
                }
                Spacer()
                Text("No commitment. Cancel any time in Settings at least one day before renewal date")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
           
            }
            .padding(.horizontal,32)
        }
    }
}

#Preview {
    RecSubscriptionScreen()
}

struct Recsubscription: View {
    var duration:String
    var price:String
    var details:String
    var isSelected:Bool
    var action:() -> Void
    var body: some View {
        ZStack(alignment:.leading){
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(isSelected ? .blue : .top)
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.white.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .blendMode(.overlay)
                    
                }
            VStack(alignment:.leading,spacing: 12){
                Text(duration).bold().font(.system(size: 16))
              
                Text(price).bold().font(.system(size: 18))
                Spacer()
                    Text(details)
                        .font(.footnote)
            }
            .font(.headline)
            .foregroundStyle(.white)
            .padding(10)
        }
        .frame(width: 110, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .frame(height: 20)
                .padding(.horizontal)
                .offset(y: 65)
                .foregroundStyle(.blue.opacity(isSelected ? 1 : 0))
                .blur(radius: 8)
        )
        .scaleEffect(isSelected ? 1.1 : 1)
        .onTapGesture {
            action()
        }
        
    }
}
