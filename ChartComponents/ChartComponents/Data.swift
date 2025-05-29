 
import Foundation

struct Transaction: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let amount: Double
}

enum ChartData {
    static let portfolioReturn: [Transaction] = [
        .init(date: .init(year: 2024, month: 8, day: 26, hour: 9), amount: 11000),
        .init(date: .init(year: 2024, month: 8, day: 26, hour: 21), amount: 5000),
        
        .init(date: .init(year: 2024, month: 8, day: 27, hour: 9), amount: 12000),
        .init(date: .init(year: 2024, month: 8, day: 27, hour: 21), amount: 10000),
        
        .init(date: .init(year: 2024, month: 8, day: 28, hour: 9), amount: 18000),
        .init(date: .init(year: 2024, month: 8, day: 28, hour: 21), amount: 14000),
        
        .init(date: .init(year: 2024, month: 8, day: 29, hour: 9), amount: 16000),
        .init(date: .init(year: 2024, month: 8, day: 29, hour: 21), amount: 11000),
        
        .init(date: .init(year: 2024, month: 8, day: 30, hour: 9), amount: 11000),
        .init(date: .init(year: 2024, month: 8, day: 30, hour: 21), amount: 16000),
        
        .init(date: .init(year: 2024, month: 8, day: 31, hour: 9), amount: 14000),
        .init(date: .init(year: 2024, month: 8, day: 31, hour: 21), amount: 20000),
        
        .init(date: .init(year: 2024, month: 9, day: 1, hour: 9), amount: 18000),
        .init(date: .init(year: 2024, month: 9, day: 1, hour: 21), amount: 20000),
    ]
    
    static let totalRevenueDay: [Transaction] = [
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 0), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 1), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 2), amount: 700),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 3), amount: 720),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 4), amount: 710),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 5), amount: 700),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 6), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 7), amount: 650),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 8), amount: 650),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 660),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 10), amount: 670),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 11), amount: 600),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 12), amount: 620),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 13), amount: 630),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 14), amount: 650),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 15), amount: 670),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 16), amount: 700),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 17), amount: 720),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 18), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 19), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 20), amount: 670),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 21), amount: 590),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 22), amount: 450),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 23), amount: 400),
    ]
    
    static let totalRevenueWeek: [Transaction] = [
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 0), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 6), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 12), amount: 620),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 18), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 19), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 23), amount: 720),
        
            .init(date: .init(year: 2024, month: 12, day: 2, hour: 0), amount: 730),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 6), amount: 750),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 12), amount: 740),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 18), amount: 790),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 19), amount: 760),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 23), amount: 770),
        
            .init(date: .init(year: 2024, month: 12, day: 3, hour: 0), amount: 780),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 6), amount: 800),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 12), amount: 820),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 18), amount: 840),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 19), amount: 900),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 23), amount: 920),
        
            .init(date: .init(year: 2024, month: 12, day: 4, hour: 0), amount: 900),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 6), amount: 860),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 12), amount: 820),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 18), amount: 740),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 19), amount: 700),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 23), amount: 650),
        
            .init(date: .init(year: 2024, month: 12, day: 5, hour: 0), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 6), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 12), amount: 700),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 18), amount: 720),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 19), amount: 740),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 23), amount: 730),
        
            .init(date: .init(year: 2024, month: 12, day: 6, hour: 0), amount: 750),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 6), amount: 780),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 12), amount: 800),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 18), amount: 800),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 19), amount: 720),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 23), amount: 700),
        
            .init(date: .init(year: 2024, month: 12, day: 7, hour: 0), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 6), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 12), amount: 620),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 18), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 19), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 23), amount: 720),
    ]
    
    static let totalRevenueMonth: [Transaction] = [
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 680),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 9), amount: 690),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 9), amount: 790),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 9), amount: 720),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 9), amount: 760),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 9), amount: 800),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 9), amount: 890),
        .init(date: .init(year: 2024, month: 12, day: 8, hour: 9), amount: 820),
        .init(date: .init(year: 2024, month: 12, day: 9, hour: 9), amount: 900),
        .init(date: .init(year: 2024, month: 12, day: 10, hour: 9), amount: 990),
        .init(date: .init(year: 2024, month: 12, day: 11, hour: 9), amount: 1200),
        .init(date: .init(year: 2024, month: 12, day: 12, hour: 9), amount: 1100),
        .init(date: .init(year: 2024, month: 12, day: 13, hour: 9), amount: 1000),
        .init(date: .init(year: 2024, month: 12, day: 14, hour: 9), amount: 1100),
        .init(date: .init(year: 2024, month: 12, day: 15, hour: 9), amount: 1400),
        .init(date: .init(year: 2024, month: 12, day: 16, hour: 9), amount: 1700),
        .init(date: .init(year: 2024, month: 12, day: 17, hour: 9), amount: 2000),
        .init(date: .init(year: 2024, month: 12, day: 18, hour: 9), amount: 2200),
        .init(date: .init(year: 2024, month: 12, day: 19, hour: 9), amount: 2450),
        .init(date: .init(year: 2024, month: 12, day: 20, hour: 9), amount: 2700),
        .init(date: .init(year: 2024, month: 12, day: 21, hour: 9), amount: 3200),
        .init(date: .init(year: 2024, month: 12, day: 22, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 12, day: 23, hour: 9), amount: 2400),
        .init(date: .init(year: 2024, month: 12, day: 24, hour: 9), amount: 2700),
        .init(date: .init(year: 2024, month: 12, day: 25, hour: 9), amount: 3200),
        .init(date: .init(year: 2024, month: 12, day: 26, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 27, hour: 9), amount: 3200),
        .init(date: .init(year: 2024, month: 12, day: 28, hour: 9), amount: 4562),
    ]
    
    static let totalRevenueYear: [Transaction] = [
        .init(date: .init(year: 2024, month: 1, day: 1, hour: 9), amount: 600),
        .init(date: .init(year: 2024, month: 1, day: 15, hour: 9), amount: 920),
        
        .init(date: .init(year: 2024, month: 2, day: 1, hour: 9), amount: 1400),
        .init(date: .init(year: 2024, month: 2, day: 15, hour: 9), amount: 1600),
        
        .init(date: .init(year: 2024, month: 3, day: 1, hour: 9), amount: 1900),
        .init(date: .init(year: 2024, month: 3, day: 15, hour: 9), amount: 2200),
        
        .init(date: .init(year: 2024, month: 4, day: 1, hour: 9), amount: 2400),
        .init(date: .init(year: 2024, month: 4, day: 15, hour: 9), amount: 2500),
        
        .init(date: .init(year: 2024, month: 5, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 5, day: 15, hour: 9), amount: 3200),
        
        .init(date: .init(year: 2024, month: 6, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 6, day: 15, hour: 9), amount: 3200),
        
        .init(date: .init(year: 2024, month: 7, day: 1, hour: 9), amount: 2100),
        .init(date: .init(year: 2024, month: 7, day: 15, hour: 9), amount: 2200),
        
        .init(date: .init(year: 2024, month: 8, day: 1, hour: 9), amount: 2500),
        .init(date: .init(year: 2024, month: 8, day: 15, hour: 9), amount: 2700),
        
        .init(date: .init(year: 2024, month: 9, day: 1, hour: 9), amount: 2600),
        .init(date: .init(year: 2024, month: 9, day: 15, hour: 9), amount: 2500),
        
        .init(date: .init(year: 2024, month: 10, day: 1, hour: 9), amount: 2800),
        .init(date: .init(year: 2024, month: 10, day: 15, hour: 9), amount: 2900),
        
        .init(date: .init(year: 2024, month: 11, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 11, day: 15, hour: 9), amount: 3200),
        
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 15, hour: 9), amount: 4500),
    ]
    
    static let totalRevenueAll: [Transaction] = [
        .init(date: .init(year: 2022, month: 1, day: 1, hour: 9), amount: 600),
        .init(date: .init(year: 2022, month: 1, day: 15, hour: 9), amount: 920),
        
            .init(date: .init(year: 2022, month: 2, day: 1, hour: 9), amount: 1400),
        .init(date: .init(year: 2022, month: 2, day: 15, hour: 9), amount: 1600),
        
            .init(date: .init(year: 2022, month: 3, day: 1, hour: 9), amount: 1900),
        .init(date: .init(year: 2022, month: 3, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2022, month: 4, day: 1, hour: 9), amount: 2400),
        .init(date: .init(year: 2022, month: 4, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2022, month: 5, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2022, month: 5, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2022, month: 6, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2022, month: 6, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2022, month: 7, day: 1, hour: 9), amount: 2100),
        .init(date: .init(year: 2022, month: 7, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2022, month: 8, day: 1, hour: 9), amount: 2500),
        .init(date: .init(year: 2022, month: 8, day: 15, hour: 9), amount: 2700),
        
            .init(date: .init(year: 2022, month: 9, day: 1, hour: 9), amount: 2600),
        .init(date: .init(year: 2022, month: 9, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2022, month: 10, day: 1, hour: 9), amount: 2800),
        .init(date: .init(year: 2022, month: 10, day: 15, hour: 9), amount: 2900),
        
            .init(date: .init(year: 2022, month: 11, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2022, month: 11, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2022, month: 12, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2022, month: 12, day: 15, hour: 9), amount: 4500),
        
        
        
            .init(date: .init(year: 2023, month: 1, day: 1, hour: 9), amount: 600),
        .init(date: .init(year: 2023, month: 1, day: 15, hour: 9), amount: 920),
        
            .init(date: .init(year: 2023, month: 2, day: 1, hour: 9), amount: 1400),
        .init(date: .init(year: 2023, month: 2, day: 15, hour: 9), amount: 1600),
        
            .init(date: .init(year: 2023, month: 3, day: 1, hour: 9), amount: 1900),
        .init(date: .init(year: 2023, month: 3, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2023, month: 4, day: 1, hour: 9), amount: 2400),
        .init(date: .init(year: 2023, month: 4, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2023, month: 5, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2023, month: 5, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2023, month: 6, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2023, month: 6, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2023, month: 7, day: 1, hour: 9), amount: 2100),
        .init(date: .init(year: 2023, month: 7, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2023, month: 8, day: 1, hour: 9), amount: 2500),
        .init(date: .init(year: 2023, month: 8, day: 15, hour: 9), amount: 2700),
        
            .init(date: .init(year: 2023, month: 9, day: 1, hour: 9), amount: 2600),
        .init(date: .init(year: 2023, month: 9, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2023, month: 10, day: 1, hour: 9), amount: 2800),
        .init(date: .init(year: 2023, month: 10, day: 15, hour: 9), amount: 2900),
        
            .init(date: .init(year: 2023, month: 11, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2023, month: 11, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2023, month: 12, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2023, month: 12, day: 15, hour: 9), amount: 4500),
        
        
        
        
        
        .init(date: .init(year: 2024, month: 1, day: 1, hour: 9), amount: 600),
        .init(date: .init(year: 2024, month: 1, day: 15, hour: 9), amount: 920),
        
            .init(date: .init(year: 2024, month: 2, day: 1, hour: 9), amount: 1400),
        .init(date: .init(year: 2024, month: 2, day: 15, hour: 9), amount: 1600),
        
            .init(date: .init(year: 2024, month: 3, day: 1, hour: 9), amount: 1900),
        .init(date: .init(year: 2024, month: 3, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2024, month: 4, day: 1, hour: 9), amount: 2400),
        .init(date: .init(year: 2024, month: 4, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2024, month: 5, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 5, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2024, month: 6, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 6, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2024, month: 7, day: 1, hour: 9), amount: 2100),
        .init(date: .init(year: 2024, month: 7, day: 15, hour: 9), amount: 2200),
        
            .init(date: .init(year: 2024, month: 8, day: 1, hour: 9), amount: 2500),
        .init(date: .init(year: 2024, month: 8, day: 15, hour: 9), amount: 2700),
        
            .init(date: .init(year: 2024, month: 9, day: 1, hour: 9), amount: 2600),
        .init(date: .init(year: 2024, month: 9, day: 15, hour: 9), amount: 2500),
        
            .init(date: .init(year: 2024, month: 10, day: 1, hour: 9), amount: 2800),
        .init(date: .init(year: 2024, month: 10, day: 15, hour: 9), amount: 2900),
        
            .init(date: .init(year: 2024, month: 11, day: 1, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 11, day: 15, hour: 9), amount: 3200),
        
            .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 15, hour: 9), amount: 4500),
    ]
    
    static let totalTransactions: [Transaction] = [
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 4500),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 9), amount: 4200),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 9), amount: 4400),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 9), amount: 4100),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 9), amount: 4000),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 9), amount: 3600),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 9), amount: 3800),
        .init(date: .init(year: 2024, month: 12, day: 8, hour: 9), amount: 3200),
        .init(date: .init(year: 2024, month: 12, day: 9, hour: 9), amount: 3100),
        .init(date: .init(year: 2024, month: 12, day: 10, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 12, day: 11, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 12, hour: 9), amount: 4000),
        .init(date: .init(year: 2024, month: 12, day: 13, hour: 9), amount: 3800),
        .init(date: .init(year: 2024, month: 12, day: 14, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 15, hour: 9), amount: 3200),
        .init(date: .init(year: 2024, month: 12, day: 16, hour: 9), amount: 2800),
        .init(date: .init(year: 2024, month: 12, day: 17, hour: 9), amount: 3700),
        .init(date: .init(year: 2024, month: 12, day: 18, hour: 9), amount: 3500),
        .init(date: .init(year: 2024, month: 12, day: 19, hour: 9), amount: 3300),
        .init(date: .init(year: 2024, month: 12, day: 20, hour: 9), amount: 3100),
        .init(date: .init(year: 2024, month: 12, day: 21, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 12, day: 22, hour: 9), amount: 2800),
        .init(date: .init(year: 2024, month: 12, day: 23, hour: 9), amount: 2600),
        .init(date: .init(year: 2024, month: 12, day: 24, hour: 9), amount: 2500),
        .init(date: .init(year: 2024, month: 12, day: 25, hour: 9), amount: 3000),
        .init(date: .init(year: 2024, month: 12, day: 26, hour: 9), amount: 2800),
        .init(date: .init(year: 2024, month: 12, day: 27, hour: 9), amount: 2600),
        .init(date: .init(year: 2024, month: 12, day: 28, hour: 9), amount: 2262),
    ]
    
    static let bitcoinData: [Transaction] = [
        .init(date: .init(year: 2024, month: 12, day: 1, hour: 9), amount: 4500),
        .init(date: .init(year: 2024, month: 12, day: 2, hour: 9), amount: 4800),
        .init(date: .init(year: 2024, month: 12, day: 3, hour: 9), amount: 4600),
        .init(date: .init(year: 2024, month: 12, day: 4, hour: 9), amount: 4900),
        .init(date: .init(year: 2024, month: 12, day: 5, hour: 9), amount: 4550),
        .init(date: .init(year: 2024, month: 12, day: 6, hour: 9), amount: 4400),
        .init(date: .init(year: 2024, month: 12, day: 7, hour: 9), amount: 3900),
        .init(date: .init(year: 2024, month: 12, day: 8, hour: 9), amount: 4600),
        .init(date: .init(year: 2024, month: 12, day: 9, hour: 9), amount: 4200),
        .init(date: .init(year: 2024, month: 12, day: 10, hour: 9), amount: 4300),
        .init(date: .init(year: 2024, month: 12, day: 11, hour: 9), amount: 4450),
        .init(date: .init(year: 2024, month: 12, day: 12, hour: 9), amount: 4600),
        .init(date: .init(year: 2024, month: 12, day: 13, hour: 9), amount: 4750),
        .init(date: .init(year: 2024, month: 12, day: 14, hour: 9), amount: 4800),
        .init(date: .init(year: 2024, month: 12, day: 15, hour: 9), amount: 4750),
        .init(date: .init(year: 2024, month: 12, day: 16, hour: 9), amount: 4700),
        .init(date: .init(year: 2024, month: 12, day: 17, hour: 9), amount: 4750),
        .init(date: .init(year: 2024, month: 12, day: 18, hour: 9), amount: 4850),
        .init(date: .init(year: 2024, month: 12, day: 19, hour: 9), amount: 4900),
        .init(date: .init(year: 2024, month: 12, day: 20, hour: 9), amount: 4500),
        .init(date: .init(year: 2024, month: 12, day: 21, hour: 9), amount: 4200),
        .init(date: .init(year: 2024, month: 12, day: 22, hour: 9), amount: 4300),
        .init(date: .init(year: 2024, month: 12, day: 23, hour: 9), amount: 4450),
        .init(date: .init(year: 2024, month: 12, day: 24, hour: 9), amount: 4500),
        .init(date: .init(year: 2024, month: 12, day: 25, hour: 9), amount: 4600),
        .init(date: .init(year: 2024, month: 12, day: 26, hour: 9), amount: 4700),
        .init(date: .init(year: 2024, month: 12, day: 27, hour: 9), amount: 4850),
        .init(date: .init(year: 2024, month: 12, day: 28, hour: 9), amount: 4950),
    ]
}

extension Date {
    init(year: Int, month: Int, day: Int, hour: Int) {
        self = Calendar.current.date(from: .init(year: year, month: month, day: day, hour: hour)) ?? .now
    }
}
