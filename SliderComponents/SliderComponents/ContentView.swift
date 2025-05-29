 

import SwiftUI

struct ContentView: View {
    @State private var simpleSliderValue: Double = 20.0
    @State private var tickSliderValue: Double = 1.0
    @State private var volumeValue: Double = 10.0
    @State private var temperatureValue: Double = 1.0
    @State private var stepperValue: Double = 90.0
    
    @State private var dualLowerValue: Double = 18
    @State private var dualUpperValue: Double = 80
    
    @State private var dualLabeledLowerValue: Double = 80
    @State private var dualLabeledUpperValue: Double = 150
    
    @State var trippleLowerValue: Double = 20
    @State var trippleMiddleValue: Double = 65
    @State var trippleUpperValue: Double = 90
    
    
    @State private var simpleCircularSliderValue: Double = 2.0
    @State private var dualCircularSliderLowerValue: Double = 20.0
    @State private var dualCircularSliderUpperValue: Double = 60.0
    @State private var customCircularValue: Double = 1.0
    var body: some View {
        ScrollView {
            VStack(spacing: 100) {
                CustomCircularSlider(
                    value: $customCircularValue
                )
                .scaleEffect(0.8)
                
                
                DualRangeCircularSlider(
                    lowerValue: $dualCircularSliderLowerValue,
                    upperValue: $dualCircularSliderUpperValue,
                    range: 0...100
                )
                
          
                SimpleCircularSlider(
                    value: $simpleCircularSliderValue,
                    range: 0...10,
                    step: 1
                )
              
               
                    TickSlider(value: $tickSliderValue, range: 0...12)
                
          
                
                TrippleRangeSlider(
                    lowerValue: $trippleLowerValue,
                    middleValue: $trippleMiddleValue,
                    upperValue: $trippleUpperValue
                )
            
                
                LabeledDualRangeSlider(
                    lowerValue: $dualLabeledLowerValue,
                    upperValue: $dualLabeledUpperValue,
                    range: 0...200
                )
            
            
                
              
                
            }
        }
        .safeAreaPadding(.vertical,100)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
