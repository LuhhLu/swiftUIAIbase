 

import SwiftUI

struct BookItemView: View {
    let book: Book
    
    var body: some View {
        HStack(alignment: .top,spacing:12) {
            Image(book.coverImage).resizable().scaledToFill()
                .frame(width: 130, height: 150)
             
            VStack(alignment: .leading, spacing: 12) {
                Text(book.name)
                    .font(.title2).fontWeight(.light)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(book.description)
                    .lineLimit(3)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                RatingView(rating: book.rating)

            }
        }
        .padding(.horizontal)
        .padding(.vertical,12)
    }
}
#Preview {
    BookItemView(book: Book(
        id: "4",
        name: "SwiftUI Development",
        pagesCount: 106,
        header: "CHAPTER I.\nDown the Rabbit-Hole",
        description: """
    Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book, ” thought Alice “without pictures or conversations?”
    """,
        coverImage: "B",
        fileName: "alice-adventures-in-wonderland",
        rating: 5.0
    ))
}

