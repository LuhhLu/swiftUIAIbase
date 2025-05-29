
import SwiftUI

struct StardOnboarding: View {
    @State var onboardingview :Int = 0
    @State var animate = false
    let transtion:AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ZStack{
                switch onboardingview{
                case 0:
                    firstView()
                        .transition(transtion)
                case 1:
                    secondView()
                        .transition(transtion)
                default:
                    ContentView()
                        .transition(transtion)
                }
            }
            if onboardingview <= 1{
                Button {
                    onboardingview += 1
                    
                } label: {
                    HStack{
                        Image(systemName: "chevron.forward")
                            .foregroundColor(animate ? .white :.white.opacity(0.2))
                            .animation(.easeInOut.repeatForever().speed(0.2), value: animate)
                        Image(systemName: "chevron.forward")
                            .foregroundColor(animate ? .white :.white.opacity(0.2))
                            .animation(.easeInOut.repeatForever().speed(0.2).delay(0.5), value: animate)
                        Image(systemName: "chevron.forward")
                            .foregroundColor(animate ? .white :.white.opacity(0.2))
                            .animation(.easeInOut.repeatForever().speed(0.2).delay(1), value: animate)
                    }
                    .bold()
                    .font(.title)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                }
                .padding()
            }
          
            
            
            
        }
        .onAppear{
            animate.toggle()
        }
         
    }
}

struct StardOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        StardOnboarding()
    }
}
