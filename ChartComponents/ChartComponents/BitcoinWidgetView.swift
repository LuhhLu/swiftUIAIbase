 

import Charts
import SwiftUI

struct BitcoinWidgetView: View {
    let data = ChartData.bitcoinData
    
    var scaleDomain: ScaleDomain {
        guard let minValue = data.map(\.amount).min(), let maxValue = data.map(\.amount).min() else { return .automatic }
        return minValue...maxValue
    }
    
    var currentValue: Double {
        data.map(\.amount).last ?? 0
    }
    
    var percentage: Double {
        guard let first = data.first, let last = data.last else { return 0 }
        return Double(last.amount - first.amount) / Double(first.amount)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack{
                Text("BTC")
                    .font(.title3).bold()
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: "bitcoinsign")
                    .resizable().scaledToFit()
                    .frame(width: 28, height: 28)
                    .bold()
                    .rotationEffect(.degrees(15))
                    .padding(10)
                    .background(
                        Circle()
                            .foregroundStyle(.orange)
                    )
                        
                
            }
            Spacer()
            Text(currentValue, format: .currency(code: "DKK").presentation(.narrow))
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding(.vertical,8)
            HStack(spacing:0){
                Text("\(Image(systemName: "triangle.fill"))")
                .font(.caption)
                Text(
                    percentage,
                    format: .percent
                        .precision(.fractionLength(2))
                )
                
            }
            .font(.title3)
            .foregroundStyle(percentage > 0 ? .green : .red)
            .padding(.bottom,25)
            Spacer()
            TransactionHistoryChart(
                data,
                selection: .constant(nil),
                kind: .minimal,
                baselineValue: data.map(\.amount).min(),
                showMedianRule: true
            )
            .chartYScale(domain: (data.map(\.amount).min() ?? 0) * 0.95...(data.map(\.amount).max() ?? 100000))
            .frame(height: 60)
            .padding(-15)
        }
        .padding()
        .frame(width: 230, height: 230)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        BitcoinWidgetView()
        
    }
}
