 
import SwiftUI

struct TotalIncomeView: View {
    var body: some View {
        VStack {
            BalanceView(transactions: ChartData.totalRevenueMonth)
            
            BalanceView(transactions: ChartData.totalTransactions)
        }
    }
}

#Preview {
    TotalIncomeView()
}

struct BalanceView: View {
    let transactions: [Transaction]
    
    var percentage: Double {
        guard let first = transactions.first, let last = transactions.last else { return 0 }
        return Double(last.amount - first.amount) / Double(first.amount)
    }
    
    var currentAmount: Double {
        transactions.last?.amount ?? 0
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Total Transactions")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Text(
                    currentAmount,format: .currency(code: "USD")
                        .precision(.integerAndFractionLength(integer: 4, fraction: 0))
                        .presentation(.narrow)
                )
                .font(.title.bold())
                .frame(maxHeight: .infinity)
                Text(
                    percentage,format: .percent
                        .precision(.fractionLength(0))
                )
                .font(.caption)
                .foregroundStyle(percentage > 0 ? .gray : .red)
                .fontWeight(.medium) + Text(" vs preview . 24 days").font(.caption).foregroundStyle(.gray)
            }
            .padding()
            .frame(height: 130)
            Spacer()
            TransactionHistoryChart(transactions, selection: .constant(nil),kind: .minimal)
                .frame(width: 140, height: 90)
                .padding(.top,25)
                .padding(.trailing,12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.BG)
        )
        .padding()
    }
}
