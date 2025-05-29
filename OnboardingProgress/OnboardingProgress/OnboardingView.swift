import SwiftUI

struct OnboardingStep {
    let image: ImageResource
    let title: String
    let description: String
    let color: Color
}

struct OnboardingView: View {
    @State  var currentStep: Int = 0
    @State  var isFinished: Bool = false
    let onboardingSteps: [OnboardingStep] = [
        OnboardingStep(image: .gifts, title: "Send & Receive Gifts", description: "Easily send and receive gifts with our seamless system.", color: .red),
        OnboardingStep(image: .analytics, title: "Data Analytics", description: "Track and analyze data to make informed decisions.", color: .yellow),
        OnboardingStep(image: .security, title: "In-App Security", description: "We ensure your data is safe with top-notch security.", color: .blue),
        OnboardingStep(image: .teamwork, title: "Teamwork in App", description: "Collaborate with your team and improve productivity.", color: .indigo),
        OnboardingStep(image: .world, title: "Traveling", description: "Plan your next adventure with our travel-friendly features.", color: .cyan)
    ]
    var body: some View {
        ZStack{
            if isFinished{
                HomeView()
                    .transition(.move(edge: .trailing))
            }else{
                VStack{
                    ProgressView(steps: onboardingSteps.count, currentStep: $currentStep)
                    Spacer()
                    DetilsVewi(onboardingSteps: onboardingSteps, currentStep: currentStep)
                    Spacer()
                }
                .padding()
                NextButton(currentStep: $currentStep, color: onboardingSteps[currentStep].color) {
                    if currentStep < onboardingSteps.count - 1 {
                        currentStep += 1
                    } else {
                        withAnimation (.linear.delay(0.5)){
                            isFinished = true
                        }
                    }
                }
            }
        }
       
    }
}

#Preview {
    OnboardingView()
}


struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Home Screen!")
                .font(.largeTitle)
                .padding()
         }
        .frame(maxWidth: .infinity)
  
    }
}



struct DetilsVewi: View {
    var onboardingSteps:[OnboardingStep]
    var currentStep: Int
    var body: some View {
        VStack{
            Image(onboardingSteps[currentStep].image).resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
               
            Text(onboardingSteps[currentStep].title).bold()
                .font(.title)
            Text(onboardingSteps[currentStep].description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .id(currentStep)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        .animation(.linear, value: currentStep)
        .frame(maxWidth: .infinity)
     
    }
}
 

