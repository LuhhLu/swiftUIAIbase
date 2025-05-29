 














import SwiftUI

struct HomeView: View {
    @State  var selectedSubscription: SubscriptionType? 
    var body: some View {
        VStack{
            Spacer()
            Text("Unlock All Features").font(.largeTitle).bold()
            Spacer()
            FeatureView()
            Spacer()
            HStack {
                subView(title: "Yearly", sale: "$100", price: "$50.00", details: "Billed Annually", type: .yearly,  selectedSubscription: $selectedSubscription)
                
                Spacer()
                subView(title: "Monthly", sale: "", price: "$10.00", details: "Billed Monthly", type: .monthly,   selectedSubscription: $selectedSubscription)
            }
            CPlan()
            Spacer()
            Button(action: {}, label: {
                Text("Subscribe").font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.black.gradient,in: Capsule())
            }).tint(.white)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            .offset(y: -10)
        }
        .padding()
        
    }
}

#Preview {
    HomeView()
}
struct CPlan: View {
    var body: some View {
        Text("Change plans or cancel anytime").foregroundStyle(.secondary)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.top)
    }
}
struct FeatureView: View {
    var features: [String] = ["Generate high-quality images", "Customizable image creation", "No ad interruptions", "24/7 support"]

    var body: some View {
        VStack(spacing:26){
            ForEach(features,id: \.self) { item in
                HStack{
                    Image(systemName: "checkmark")
                    Text(item).font(.headline)
                    Spacer()
                }
              
            }
        }
       
    }
}
