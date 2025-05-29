 
import SwiftUI

struct NumberFormatting: View {
    @State var Numbers: Double = 0
    var formattedMoney: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: Numbers / 100)) ?? "$0.00"
    }
    var body: some View {
        VStack{
            RollingNumberView(number: formattedMoney)
            Button {
                withAnimation {
                    Numbers = Double(Int.random(in: 10000...1050030))
                }
            } label: {
                Text("Generate Number")
                    .font(.title)
                    .padding()
            }

        }
    }
}

#Preview {
    NumberFormatting()
}
