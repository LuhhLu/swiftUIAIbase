 


import Foundation
import SwiftData

@Model
class BookProgress: Identifiable, Equatable {
    @Attribute(.unique) var id: String
    var name: String
    var percentage: Float
    var currentPageIndex: Int
    
    init(book: Book, progress: Float = 0.0, currentPageIndex: Int = 0) {
        self.id = book.id
        self.name = book.name
        self.percentage = progress
        self.currentPageIndex = currentPageIndex
    }
}
