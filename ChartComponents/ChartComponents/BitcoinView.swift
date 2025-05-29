 

import SwiftUI

struct BitcoinView: View {
    @State private var data: [Transaction] = ChartData.totalRevenueMonth
    @State private var selection: DataRange = .month
    @State private var chartSelection: Transaction?
    
    var body: some View {
        VStack {
            Text("XRP - XRP")
                .frame(maxWidth: .infinity, alignment: .leading)
            let transaction: Transaction = if let chartSelection {
                chartSelection
            } else {
                data.last!
            }
            
            Text(transaction.amount, format: .currency(code: "USD").presentation(.narrow))
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            
            if let firstTransaction = data.first{
                let delta = transaction.amount - firstTransaction.amount
                let percentage = firstTransaction.amount/transaction.amount
                HStack(spacing:0){
                    Text(
                        transaction.amount - firstTransaction.amount,
                        format: .currency(code: "USD").presentation(.narrow).sign(strategy: .always())
                    )
                    .foregroundStyle(.gray)
                    
                    Text(" \(Image(systemName: "triangle.fill")) ")
                        .font(.caption)
                        .foregroundStyle(delta > 0 ? .green : .red)
                        .rotationEffect(delta > 0 ? .zero : .degrees(-180))
                    
                    Text(
                        percentage,
                        format: .percent
                            .precision(.fractionLength(2))
                    )
                    .foregroundStyle(delta > 0 ? .green : .red)
                }
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            if chartSelection != nil {
                Text(transaction.date, format: .dateTime)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            } else {
                Text(" ")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            TransactionHistoryChart(
                data,
                selection: $chartSelection,
                valueIndicator: .line
            )
            .padding(.top)
            
            HStack(spacing: .zero) {
                ForEach(DataRange.allCases, id: \.self) { item in
                    Text(item.rawValue).tag(item)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .font(.caption2)
                        .foregroundStyle(selection == item ? Color.white : Color.gray)
                        .background {
                            if selection == item {
                                RoundedRectangle(cornerRadius: 20, style: .circular)
                                    .fill(.gray)
                            }
                        }
                        .onTapGesture { selection = item }
                }
            }
            .padding(4)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .stroke(style: .init(lineWidth: 1))
            }
            .foregroundStyle(.gray)
        }
        .padding()
        .foregroundStyle(.white)
        .fontWeight(.medium)
        .frame(height: 460)
        .onChange(of: selection) {
            switch selection {
            case .day:
                data = ChartData.totalRevenueDay
            case .week:
                data = ChartData.totalRevenueWeek
            case .month:
                data = ChartData.totalRevenueMonth
            case .year:
                data = ChartData.totalRevenueYear
            case .all:
                data = ChartData.totalRevenueAll
            }
        }
    }
}

#Preview {
        BitcoinView()
}
