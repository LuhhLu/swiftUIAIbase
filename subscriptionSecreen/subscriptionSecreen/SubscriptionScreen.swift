

import SwiftUI

enum SubscriptionType{
    case free,monthly,lifetime
}
struct SubscriptionScreen: View {
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
                VStack(spacing:20){
                    subscription(duration: "Free", price: "$0", details: "With Ads", isSelected: selectedSubscription == .free, action: {selectedSubscription = .free})
                    
                    subscription(duration: "Monthly", price: "$4.99", details: "Billed Monthly", isSelected:selectedSubscription == .monthly , action: {selectedSubscription = .monthly})
                        .overlay(alignment: .topTrailing) {
                            likeView(icon: "hand.thumbsup.fill")
                                .offset(x: 12, y: -14)
                        }
                    
                    subscription(duration: "Lifetime", price: "$99.99", details: "One-time payment", isSelected:selectedSubscription == .lifetime , action: {selectedSubscription = .lifetime})
                    
                }
                linksView()
            }
            .padding(.horizontal,32)
        }
    }
}
#Preview {
    
    SubscriptionScreen()
}
 

struct linksView: View {
    var body: some View {
        HStack{
            Text("Terms of Use")
            Spacer()
            Text("or Restore Purchases")
            Spacer()
            Text("Privacy Policy")
        }
        .font(.footnote)
        .foregroundStyle(.gray)
    }
}

struct likeView: View {
    var icon:String
    var body: some View {
        Image(systemName: icon)
            .foregroundStyle(.white)
            .padding(5)
            .background(.top,in: Circle())
            .overlay {
                Circle().stroke(lineWidth: 1)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.white.opacity(0.3)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            }
    }
}

 
struct subscription: View {
    var duration:String
    var price:String
    var details:String
    var isSelected:Bool
    var action:() -> Void
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 70)
                .foregroundStyle(isSelected ? .blue : .top)
                .overlay {
                    RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.white.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .blendMode(.overlay)
                    
                }
            HStack{
                Text(duration).bold()
                Spacer()
                VStack(alignment:.trailing,spacing:8){
                    Text(price)
                    Text(details)
                        .font(.footnote)
                }
            }
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.horizontal,16)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .frame(height: 20)
                .padding(.horizontal)
                .offset(y: 25)
                .foregroundStyle(.blue.opacity(isSelected ? 1 : 0))
                .blur(radius: 8)
            
        )
        .onTapGesture {
            action()
        }
    }
}

 
