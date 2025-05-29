 
import Charts
import SwiftUI

enum DataRange: String, CaseIterable {
    case day = "1D"
    case week = "7D"
    case month = "1M"
    case year = "1Y"
    case all = "All"
}

struct PortfolioReturnView: View {
    @State private var data: [Transaction] = ChartData.totalRevenueMonth
    @State private var selection: DataRange = .month
    @State private var chartSelection: Transaction?
    
    var body: some View {
        VStack {
            HStack{
                Text("Portfolio Return")
                    .font(.subheadline)
                Spacer()
                HStack(spacing:0) {
                    ForEach(DataRange.allCases,id:\.self) { item in
                        Text(item.rawValue).tag(item)
                            .padding(.vertical,4)
                            .padding(.horizontal,8)
                            .font(.caption2)
                            .foregroundStyle(selection == item ? .white : .gray)
                            .background {
                                if selection == item {
                                    Capsule()
                                        .foregroundStyle(.gray.opacity(0.3))
                                }
                            }
                            .onTapGesture {
                                selection = item
                            }
                        
                    }
                }
                .padding(4)
                .background {
                    Capsule()
                        .foregroundStyle(.gray.opacity(0.2))
                }
            }
            .padding(.bottom)
            TransactionHistoryChart(
                data,
                selection: $chartSelection,
                valueIndicator: .lollipop
            )
        }
        .fontWeight(.medium)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.BG)
        }
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
    ZStack {
        Color.black.ignoresSafeArea()
        PortfolioReturnView()
            .frame(height: 220)
    }
}

extension Decimal.FormatStyle {
    struct CompactCurrency: FormatStyle {
        let code: String
        var locale: Locale = .autoupdatingCurrent
        
        func format(_ value: Decimal) -> String {
            let currencyFormatStyle = Decimal.FormatStyle
                .Currency(code: code, locale: locale)
                .presentation(.narrow)
                .notation(.compactName)
                .precision(.fractionLength(0))
            
            let numberFormatStyle = Decimal.FormatStyle(locale: locale).rounded()
            let currencyFormatted = value.formatted(currencyFormatStyle)
            let fullNumber = value.formatted(numberFormatStyle)
            let compactNumber = value.formatted(numberFormatStyle.notation(.compactName))
            
            return currencyFormatted.replacing(fullNumber, with: compactNumber)
        }
    }
}
