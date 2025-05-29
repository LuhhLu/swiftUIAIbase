
import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let date: String
    let amount: Double
}

struct CircularSegment {
    let color: Color
    let value: Double
    let transactions: [Transaction]  // Each account has transactions
}

struct CustomCircularChart: View {
    let segments: [CircularSegment] // Accept segments dynamically
    
    @State private var selectedIndex: Int = 0 // Track the active segment
    
    private let lineWidth: CGFloat = 20 // Thickness of the circle
    private let spacerColor: Color = .clear // Color for the spacer
    private let spacerFraction: CGFloat = 0.05 // Fraction of the circle allocated for each spacer
    
    // Compute the total amount dynamically
    private var totalAmount: Double {
        segments.map { $0.value }.reduce(0, +)
    }
    
    // Compute all transactions (for Total Amount view)
    private var allTransactions: [Transaction] {
        segments.flatMap { $0.transactions } // Merge all transactions from all accounts
    }
    
    // Calculate dynamic segments with proportions
    private var calculatedSegments: [(color: Color, startFraction: CGFloat, endFraction: CGFloat)] {
        let totalValue = segments.map { $0.value }.reduce(0, +) // Total of all account values
        let totalSpacersFraction = CGFloat(segments.count) * spacerFraction
        let totalAvailableFraction = 1.0 - totalSpacersFraction // Remaining fraction for accounts
        
        var startFraction: CGFloat = 0
        var result: [(color: Color, startFraction: CGFloat, endFraction: CGFloat)] = []
        
        for segment in segments {
            // Add a black spacer
            let spacerEndFraction = startFraction + spacerFraction
            result.append((color: spacerColor, startFraction: startFraction, endFraction: spacerEndFraction))
            startFraction = spacerEndFraction
            
            // Calculate the proportion of the segment
            let segmentFraction = CGFloat(segment.value / totalValue) * totalAvailableFraction
            let segmentEndFraction = startFraction + segmentFraction
            result.append((color: segment.color, startFraction: startFraction, endFraction: segmentEndFraction))
            startFraction = segmentEndFraction
        }
        
        return result
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:24) {
                ZStack {
                    ZStack {
                      
                        ForEach(segments.indices,id:\.self) { index in
                            let segment = segments[index]
                            Circle()
                                .trim(from: calculatedSegments[index * 2 + 1].startFraction, to: calculatedSegments[index * 2 + 1].endFraction)
                                .stroke(segment.color,style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                                .containerShape(Rectangle())
                                .rotationEffect(.degrees(-90))
                                .frame(width: 200, height: 200)
                                .scaleEffect(selectedIndex == 0 ? 1 : (selectedIndex == index + 1 ? 1.1 : 1))
                                .animation(.spring, value: selectedIndex)
                                .onTapGesture{
                                    selectedIndex = index + 1
                                }
                        }
                        
                    }
                    .zIndex(1)
                    TabView(selection: $selectedIndex) {
                        VStack{
                            Text("Total Amount")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("$\(Int(totalAmount))")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .offset(y: 12)
                               
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(0)
                        
                        ForEach(segments.indices ,id:\.self) { index in
                            let segment = segments[index]
                            VStack{
                                Text("Account \(index + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.gray)
                                   
                                Text("$\(Int(segment.value))")
                                    .font(.largeTitle.bold())
                                    .offset(y: 12)
                                   
                            }
                       
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(index + 1)
                           
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(width: 170, height: 170)
                    .offset(y: -20)
                    .mask(Circle().frame(width: 170, height: 170))
                    
                    
                    
                 
                }
                
                VStack(spacing:0) {
                    ForEach(selectedIndex == 0 ? allTransactions : segments[selectedIndex - 1].transactions) { transaction in
                        HStack(spacing: 12) {
                            Text(transaction.icon)
                                .frame(width: 50, height: 50)
                                .background(.gray.opacity(0.2),in:.rect(cornerRadius: 12))
                            VStack(alignment: .leading, spacing: 8) {
                                Text(transaction.title)
                                    .font(.system(size: 16)).bold()
                                Text(transaction.date)
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                                
                                
                            }
                            Spacer()
                            Text("\(Int(transaction.amount)) $")
                        }
                        .padding(12)
                    }
                }
                .padding(10)
                .padding(.top,44)
                
            }
        }
        .safeAreaPadding(.top,44)
    }
}














//
//
//
//
//
//
//
//import SwiftUI
//
//
//import SwiftUI
//
//struct Transaction: Identifiable {
//    let id = UUID()
//    let icon: String  // Emoji for category
//    let title: String
//    let date: String
//    let amount: Double
//}
//
//struct CircularSegment {
//    let color: Color
//    let value: Double
//    let transactions: [Transaction]  // Each account has transactions
//}
//
//struct CustomCircularChart: View {
//    let segments: [CircularSegment] // Accept segments dynamically
//    
//    @State private var selectedIndex: Int = 0 // Track the active segment
//    
//    private let lineWidth: CGFloat = 20 // Thickness of the circle
//    private let spacerColor: Color = .clear // Color for the spacer
//    private let spacerFraction: CGFloat = 0.05 // Fraction of the circle allocated for each spacer
//    
//    // Compute the total amount dynamically
//    private var totalAmount: Double {
//        segments.map { $0.value }.reduce(0, +)
//    }
//    
//    // Compute all transactions (for Total Amount view)
//    private var allTransactions: [Transaction] {
//        segments.flatMap { $0.transactions } // Merge all transactions from all accounts
//    }
//    
//    // Calculate dynamic segments with proportions
//    private var calculatedSegments: [(color: Color, startFraction: CGFloat, endFraction: CGFloat)] {
//        let totalValue = segments.map { $0.value }.reduce(0, +) // Total of all account values
//        let totalSpacersFraction = CGFloat(segments.count) * spacerFraction
//        let totalAvailableFraction = 1.0 - totalSpacersFraction // Remaining fraction for accounts
//        
//        var startFraction: CGFloat = 0
//        var result: [(color: Color, startFraction: CGFloat, endFraction: CGFloat)] = []
//        
//        for segment in segments {
//            // Add a black spacer
//            let spacerEndFraction = startFraction + spacerFraction
//            result.append((color: spacerColor, startFraction: startFraction, endFraction: spacerEndFraction))
//            startFraction = spacerEndFraction
//            
//            // Calculate the proportion of the segment
//            let segmentFraction = CGFloat(segment.value / totalValue) * totalAvailableFraction
//            let segmentEndFraction = startFraction + segmentFraction
//            result.append((color: segment.color, startFraction: startFraction, endFraction: segmentEndFraction))
//            startFraction = segmentEndFraction
//        }
//        
//        return result
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing:24) {
//                ZStack {
////                    ZStack {
////                        ForEach(0..<calculatedSegments.count, id: \.self) { index in
////                            let segment = calculatedSegments[index]
////                            if segment.color == spacerColor {
////                                Circle()
////                                    .trim(
////                                        from: segment.startFraction,
////                                        to: segment.endFraction
////                                    )
////                                    .stroke(segment.color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
////                                    .rotationEffect(.degrees(-90))
////                                    .frame(width: 250, height: 250)
////                            }
////                        }
////                    }
//                    
//                    // Render the colored segments on top
//                    ZStack {
//                        ForEach(segments.indices, id: \.self) { index in
//                            let segment = segments[index]
//                            
//                            Circle()
//                                .trim(
//                                    from: calculatedSegments[index * 2 + 1].startFraction,
//                                    to: calculatedSegments[index * 2 + 1].endFraction
//                                )
//                                .stroke(segment.color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
//                                .rotationEffect(.degrees(-90))
//                                .frame(width: 200, height: 200)
//                                .scaleEffect(selectedIndex == 0 ? 1 : (selectedIndex == index + 1 ? 1.1 : 1))
//                                .animation(.spring(), value: selectedIndex)
//                                .onTapGesture {
//                                    selectedIndex = index + 1
//                                }
//                        }
//                    }
//                    
//                    
//                    TabView(selection: $selectedIndex) {
//                        // Total Amount Page
//                        VStack {
//                            Text("Total Amount")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                            
//                            Text("$\(Int(totalAmount))")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                            
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .tag(0)
//                        
//                        
//                        ForEach(segments.indices, id: \.self) { index in
//                            let segment = segments[index]
//                            VStack {
//                                Text("Account \(index + 1)")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                                Text("$\(Int(segment.value))")
//                                    .font(.largeTitle)
//                                    .fontWeight(.bold)
////                                    .foregroundColor(segment.color)
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .tag(index + 1)
//                        }
//                        
//                    }
//                    .tabViewStyle(PageTabViewStyle())
//                    .frame(width: 160, height: 160)
//                    .mask(
//                        Circle()
//                            .frame(width: 160, height: 160)
//                    )
//                }
//                
//                VStack(spacing:12) {
//                    ForEach(selectedIndex == 0 ? allTransactions : segments[selectedIndex - 1].transactions) { transaction in
//                        HStack(spacing:12) {
//                            Text(transaction.icon)
//                                .frame(width: 50, height: 50)
//                                .background(.gray.opacity(0.2),in:.rect(cornerRadius:12))
//                            VStack(alignment: .leading,spacing:8) {
//                                Text(transaction.title)
//                                    .font(.system(size: 16)).bold()
//                                Text(transaction.date)
//                                    .font(.system(size: 13))
//                                    .foregroundColor(.gray)
//                            }
//                            Spacer()
//                            Text("\(Int(transaction.amount)) $")
//                        }
//                        .padding(12)
//                    }
//                }
//                .padding(10)
//                .padding(.top,34)
//            }
//        }
//        .safeAreaPadding(.top,44)
//    }
//}
