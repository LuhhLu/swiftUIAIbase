 
import Charts
import SwiftUI

struct TransactionHistoryChart: View {
    let kind: Kind
    let data: [Transaction]
    let showMedianRule: Bool
    let valueIndicator: ValueIndicator
    let baselineValue: Double?
    
    @Binding var selectedElement: Transaction?
    
    var color: Color {
        guard let first = data.first, let last = data.last else { return .gray }
        return first.amount > last.amount ? .red : .green
    }
    
    var median: Double {
        data.map(\.amount).reduce(0, +) / Double(data.count)
    }
    
    init(
        _ data: [Transaction],
        selection: Binding<Transaction?>,
        kind: Kind = .full,
        baselineValue: Double? = nil,
        showMedianRule: Bool = false,
        valueIndicator: ValueIndicator = .none
    ) {
        self.data = data
        self.kind = kind
        _selectedElement = selection
        self.baselineValue = baselineValue
        self.showMedianRule = showMedianRule
        self.valueIndicator = valueIndicator
    }
    
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Date", $0.date),
                y: .value("Transaction", $0.amount)
            )
            .lineStyle(StrokeStyle(lineWidth: 2))
            .foregroundStyle(color)
            .interpolationMethod(.cardinal)
            .symbol(Circle().strokeBorder(lineWidth: 8))
            .symbolSize(0)
            
            AreaMark(
                x: .value("Date", $0.date),
                y: .value("Transaction", $0.amount)
            )
            .interpolationMethod(.cardinal)
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [
                        color.opacity(0.4),
                        color.opacity(0.0)
                    ]),
                    startPoint: .top,
                    endPoint: .init(x: 0.5, y: baselineValue == nil ? 0.9 : 0.25)
                )
            )
            
            if showMedianRule {
                RuleMark(y: .value("Transaction", median))
                    .lineStyle(.init(lineWidth: 3, dash: [3, 10]))
                    .foregroundStyle(.gray.mix(with: .white, by: 0.5))
            }

            if let selectedElement, valueIndicator != .none {
                RuleMark(x: .value("Date", selectedElement.date))
                    .foregroundStyle(.gray.mix(with: .white, by: 0.6))
                
                PointMark(x: .value("Date", selectedElement.date), y: .value("Transaction", selectedElement.amount))
                    .foregroundStyle(color)
            }
        }
        .chartXAxis(kind.visibility)
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic(desiredCount: 7)) { value in
                AxisGridLine(stroke: StrokeStyle(dash: [8, 8]))
                    .foregroundStyle(.gray.opacity(0.2))
                AxisValueLabel()
//                    .foregroundStyle(.white)
            }
        }
        .chartYAxis(kind.visibility)
        .chartYAxis {
            AxisMarks(position: .leading) { value in
                AxisGridLine(stroke: StrokeStyle(dash: [8, 8]))
                    .foregroundStyle(.gray.opacity(0.2))
                AxisValueLabel(format: Decimal.FormatStyle.CompactCurrency.init(code: "USD"))
//                    .foregroundStyle(.white)
            }
        }
        .chartOverlay { proxy in
            GeometryReader { geo in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                selectedElement = findElement(location: value.location, proxy: proxy, geometry: geo)
                            }
                            .onEnded { _ in
                                selectedElement = nil
                            }
                    )
            }
        }
        .chartOverlay { proxy in
            ZStack(alignment: .topLeading) {
                GeometryReader { geo in
                    if valueIndicator == .lollipop, let selectedElement {
                        let dateInterval = Calendar.current.dateInterval(of: .minute, for: selectedElement.date)!
                        let startPositionX1 = proxy.position(forX: dateInterval.start) ?? 0
                        
                        let lineX: CGFloat = if let plotFrame = proxy.plotFrame {
                            startPositionX1 + geo[plotFrame].origin.x
                        } else { 0 }
                        
                        let boxWidth: CGFloat = 40
                        let boxOffset = max(0, min(geo.size.width - boxWidth, lineX - boxWidth / 2))
                                                
                        VStack(alignment: .center) {
                            Text("\(selectedElement.amount, format: .number)")
                                .font(.caption)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity)
                        }
                        .frame(width: boxWidth, alignment: .leading)
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.background)
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.quaternary.opacity(0.7))
                            }
                        }
                        .offset(x: boxOffset)
                    }
                }
            }
        }
    }
    
    private func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> Transaction? {
        let relativeXPosition: CGFloat = if let plotFrame = proxy.plotFrame {
            location.x - geometry[plotFrame].origin.x
        } else { 0 }
        
        if let date = proxy.value(atX: relativeXPosition) as Date? {
            var minDistance: TimeInterval = .infinity
            var index: Int? = nil
            for dataIndex in data.indices {
                let nthDataDistance = data[dataIndex].date.distance(to: date)
                if abs(nthDataDistance) < minDistance {
                    minDistance = abs(nthDataDistance)
                    index = dataIndex
                }
            }
            
            if let index {
                return data[index]
            }
        }
        return nil
    }
}

extension TransactionHistoryChart {
    enum Kind {
        case minimal
        case full
        
        var visibility: Visibility {
            switch self {
            case .minimal:
                return .hidden
            case .full:
                return .visible
            }
        }
    }
    
    enum ValueIndicator {
        case none, line, lollipop
    }
}

#Preview {
    @Previewable @State var selection: Transaction?
    
    TransactionHistoryChart(
        ChartData.totalRevenueDay,
        selection: $selection,
        kind: .full,
        showMedianRule: true,
        valueIndicator: .lollipop
    )
}
