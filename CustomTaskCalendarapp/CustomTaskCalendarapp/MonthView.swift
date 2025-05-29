 

import SwiftUI

struct MonthView: View {
    let month: Month
    let items: [Item]
    @Binding var selectedDay: Date?
    
    var body: some View {
        VStack(spacing: .zero) {
            ForEach(month.weeks) { week in
                HStack(spacing:0){
                    ForEach(week.days,id:\.self) { day in
                        VStack{
                            Text(Calendar.dayNumber(from: day))
                                .background(
                                    Circle()
                                        .fill(.blue)
                                        .frame(width: 30, height: 30)
                                        .opacity(selectedDay == day ? 0.3 : 0)
                                       
                                )
                                .padding(.top)
                                .foregroundStyle(Calendar.isSameMonth(day, month.initializedDate) ? .primary : .tertiary)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            Rectangle()
                                .stroke(style: .init(lineWidth: 0.25))
                                .fill(.gray)
                        }
                        .onTapGesture {
                            selectedDay = day
                        }
                        .overlay {
                            VStack( spacing: 5) {
                                let items = itemsFor(day: day)
                                ForEach(0..<3) { index in
                                    if index < items.count{
                                        minimalItemView(for: items[index])
                                            .padding(.horizontal,5)
                                    }
                                   
                                }
                                Text("+\(items.count - 2)")
                                    .font(.caption2)
                                    .padding(.top, 4)
                                    .foregroundStyle(.secondary)
                                    .frame(height: 10)
                                    .opacity(items.count > 3 ? 1 : 0)
                                    .padding(.bottom,10)
                            }
                            .frame(maxWidth: .infinity,maxHeight:.infinity)
                            .padding(.top,46)
                        }
                    }
                    
                }
            }
        }
    }
    
    func minimalItemView(for item: Item) -> some View {
        RoundedRectangle(cornerRadius: 24)
            .foregroundStyle(item.color.mix(with: .black, by: 0.2))
            .frame(height: 5)
         
    }
    
    func itemsFor(day: Date) -> [Item] {
        items.filter { item in
            Calendar.current.isDate(item.from, inSameDayAs: day)
        }
    }
}


  
