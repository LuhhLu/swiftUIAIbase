
import SwiftUI

struct ContentView: View {
    @State var targetValue:Int = 000
    @State var offset:[CGFloat] = [0,0,0]// Offsets for the three digits.
    
    var body: some View {
        VStack(spacing: 40) {
            HStack{
                // We're using the same view for each digit and passing a different offset.
                SingleDigitView(offset: offset[0])
                SingleDigitView(offset: offset[1])
                SingleDigitView(offset: offset[2])
            }
            .frame(width: 200, height: 70)
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5)
                HStack(spacing: 63){
                    Rectangle().frame(width: 5, height: 65)
                    Rectangle().frame(width: 5, height: 65)
                }
            }
            Button {
                generateRandomNumber()
            } label: {
                Text("Generate Number")
            }

        }
        .padding()
    }
    // This view represents a single digit from 0 to 9, which rolls.
    struct SingleDigitView:View{
        var offset:CGFloat = 0 // This view represents a single digit from 0 to 9, which rolls.
        var body: some View{
            GeometryReader{ geometry in
                VStack(spacing: 0){
                    ForEach(0..<10 ){ number in
                        Text("\(number)").font(.largeTitle).bold()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        
                    }
                }
                .offset(y: -offset) // Apply the shifting.
            }
            // Ensure the view is clipped to show only one number.
            .clipped()
        }
    }
    // This function sets the visual offset for each digit to show the correct number.
    func setOffsets(){
        // 1. Convert the 'targetValue' to a string with 3 digits, filling with zeros if needed.
        // For example, '56' becomes '056'.
        let digits = String(format: "%03d", targetValue) .map{String($0)}
        // 2. Animate the change in offset smoothly over 1 second.
        withAnimation(.easeInOut(duration: 1.0)){
            // 3. For each digit in our 'digits' array...
            for (index,digit) in  digits.enumerated(){
                offset [index] = CGFloat(Int(digit)!) * 70
                // 4. Convert the current digit from a string back to a number.
                // Then, calculate the offset for that digit.
                // Since each number's height is assumed to be 60 units,
                // multiplying the digit by 60 gives us the required offset.
                // For example, if the digit is '2', the offset is 2 * 60 = 120.
                
            }

        }
    }
    // Generates a random number and updates the display.
    func generateRandomNumber() {
        targetValue = Int.random(in: 0...999)
        setOffsets()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
