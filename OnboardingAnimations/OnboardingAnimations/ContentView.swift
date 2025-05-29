import SwiftUI

 
struct ContentView: View {
    let features = [
        Feature(icon: "bell.fill", title: "Unlimited Tasks", description: "Set reminders and alerts to never miss a deadline"),
        Feature(icon: "checkmark", title: "Reminders & Alerts", description: "Create unlimited tasks without any restrictions"),
        Feature(icon: "star.fill",title: "Task Prioritization", description: "Prioritize tasks to focus on what matters most"),
        Feature(icon: "cloud.fill",  title: "Cloud Sync", description: "Sync your tasks across all devices seamlessly"),
    ]
    @State var visibleFeatures: [UUID] = []
    @State var ShowButton = false
    var body: some View {
        VStack(spacing: 40) {
            
            VStack {
                Text("Welcome to").font(.system(size: 60))
                HStack{
                    Text("Todos")
                    Image(systemName: "checkmark.seal.fill")
                }.font(.system(size: 50))
            }
            .foregroundStyle(.gray.gradient)
            .animation(.linear(duration: 0.50), value: visibleFeatures)
            
            VStack(spacing: 24) {
                ForEach(features) { feature in
                    if visibleFeatures.contains(feature.id) {
                        FeatureView(feature: feature)
                            .transition(.opacity.combined(with: .offset(y: 100)))
                    }
                }
            }
            .animation(.linear(duration: 0.5), value: visibleFeatures)
            
            
            if ShowButton{
                Button {
                    //
                } label: {
                    Text("Get started").font(.title2).frame(height: 50)
                        .frame(maxWidth: .infinity).background(.white, in: .capsule)
                }
                .tint(.black).padding(.horizontal).offset(y: 34)
                .transition(.opacity.combined(with: .offset(y: 100)))
            }
        }.onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + 1) {showFeaturesWithDelay()}
        }
        
    }
    
  
    private func showFeaturesWithDelay() {
        for (index, feature) in features.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 2.0) {
                    visibleFeatures.append(feature.id)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
                withAnimation (.linear(duration: 0.5)){
                    ShowButton = true
                }
            }
                            
        }
    }
}
#Preview {
    ContentView()
}
