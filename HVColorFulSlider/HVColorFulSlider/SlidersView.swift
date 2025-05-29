
import SwiftUI

struct SlidersView: View {
    @State private var sliderValue: Double = 0.0
    var body: some View {
        VStack(spacing:40){
            CustomSlider(width: 50, height: 300, axis: .vertical, thevalue: $sliderValue)
            CustomSlider(width: 100, height: 20, axis: .horizontal, thevalue: $sliderValue)
           
        }
    }
}

#Preview {
    SlidersView()
}
