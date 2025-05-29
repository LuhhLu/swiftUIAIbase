 

import SwiftUI
enum TimelineItemStyle {
    case compact, full
}

struct TimelineView: View {
    let day: Date
    let items: [Item] = Items.data
    let style: TimelineItemStyle
    
    var body: some View {
        VStack(spacing: .zero) {
            ForEach(0..<(24 * Int(Constants.hourDivisionCount))) { hour in
                Rectangle()
                    .stroke(style: .init(lineWidth: 0.25))
                    .fill(.gray)
                    .frame(height: Constants.hourHeight / Constants.hourDivisionCount)
                    .frame(maxWidth: .infinity)
            }
        }
        .overlay {
            ZStack(alignment: .top) {
                ForEach(itemsForDay()) { item in
                    VStack(spacing: .zero) {
                        switch style {
                        case .compact:
                            compactItemView(for: item)
                            
                        case .full:
                            fullItemView(for: item)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: calculateHeight(for: item) - 4)
                    .background(item.color.mix(with: .white, by: 0.4))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .circular)
                            .stroke(item.color)
                    )
                    .padding(.all, 2)
                    .padding(.top, calculateOffset(for: item))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
    func compactItemView(for item: Item) -> some View {
        VStack(spacing: .zero) {
            Text(item.title)
                .font(.system(size: 9, weight: .medium))
                .padding(.all, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(item.color.mix(with: .black, by: 0.7))
            
            Spacer()
        }
    }
    
    func fullItemView(for item: Item) -> some View {
        VStack(spacing: .zero) {
            Text(item.title)
                .font(.system(size: 9, weight: .medium))
                .padding(.all, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(item.color.mix(with: .black, by: 0.7))
            
            Text(item.subtitle)
                .font(.system(size: 8, weight: .light))
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(item.color.mix(with: .black, by: 0.7))
                .padding(.bottom, 8)
            Text(item.description)
                .font(.system(size: 8, weight: .regular))
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(item.color.mix(with: .black, by: 0.7))
            Spacer()
        }
    }
}

extension TimelineView {
    func itemsForDay() -> [Item] {
        items.filter { item in
            Calendar.current.isDate(item.from, inSameDayAs: day)
        }
    }
    
    func calculateOffset(for item: Item) -> CGFloat {
        let startOfDay = Calendar.current.startOfDay(for: item.from)
        let elapsedTime =  item.from.timeIntervalSince(startOfDay)
        return CGFloat(elapsedTime) / 3600.0 * Constants.hourHeight
    }
    
    func calculateHeight(for item: Item) -> CGFloat {
        let elapsedTime = item.to.timeIntervalSince(item.from)
        return CGFloat(elapsedTime) / 3600.0 * Constants.hourHeight
    }
}

#Preview {
    ScrollView {
        TimelineView(day: .now, style: .full)
    }
}
