import SwiftUI
struct FeaturesAnimation: View {
    @State var startAnimations: [Bool] = [false, false, false, false]
    @State var start = false
    var features: [String] = ["Generate high-quality images", "Customizable image creation", "No ad interruptions", "24/7 support"]
    var body: some View {
          VStack(alignment: .leading, spacing: 26) {
              Text("Features/ Benefits").font(.headline)
                  .foregroundStyle(.white)
              ForEach(features.indices, id: \.self) { index in
                  featureswithAnimation(title: features[index], start: $startAnimations[index])
                      .onAppear {
                          DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 2.0) {
                              withAnimation {
                                  startAnimations[index] = true
                              }
                          }
                      }
              }
              Spacer()
          }
          .frame(height: 150)
          .padding(.top)
      }
}
struct featureswithAnimation: View {
    var title: String
    @Binding var start: Bool
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .foregroundStyle(.green)
                .scaleEffect(start ? 1 : 0)
            TypingEffect(fullText: title, isExpanded: $start)
                .foregroundStyle(.white)
                .frame(height: 10)
            Spacer()
        }
    }
}

struct TypingEffect: View {
    @State private var displayedText = ""
    var fullText: String
    @State private var currentCharacterIndex: String.Index!
    @Binding var isExpanded: Bool
    
    var body: some View {
        VStack {
            Text(displayedText).bold().font(.headline)
                .foregroundColor(.white)
        }
        .onChange(of: isExpanded) { oldValue, newValue in
            if newValue {
                startTypingEffect()
            }
        }
    }
    
    func startTypingEffect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            currentCharacterIndex = fullText.startIndex
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                displayedText.append(fullText[currentCharacterIndex])
                currentCharacterIndex = fullText.index(after: currentCharacterIndex)
                if currentCharacterIndex == fullText.endIndex {
                    timer.invalidate()
                }
            }
        }
    }
}

 
