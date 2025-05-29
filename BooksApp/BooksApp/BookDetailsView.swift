 

import SwiftData
import SwiftUI

struct BookDetailsView: View {
    let book: Book
    
    @Environment(\.dismiss) private var dismiss
    @Binding var navigationPath: [Navigator.Path]
    @Query private var progresses: [BookProgress]
    @Environment(\.modelContext) private var modelContext

    var bookProgress: BookProgress? {
        progresses.first(where: { $0.id == book.id })
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Image(book.coverImage).resizable().scaledToFill()
                    .frame(height: 460)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .padding(.bottom)
                
                VStack{
                    HStack{
                        Text(book.name).font(.title.bold())
                        Spacer()
                        RatingView(rating: book.rating)
                     }
                    .padding(.bottom)
                    if let bookProgress {
                        Text("completed \(Text(bookProgress.percentage, format: .percent.precision(.fractionLength(0))))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        
                        ProgressView(value: bookProgress.percentage)
                            .progressViewStyle(.linear)
                            .tint(.progress)
                            .padding(.bottom)
                    }
                    Text(book.description)
                        .foregroundStyle(.secondary)
                      
                }
                .padding(.horizontal)
            }
        }
        
        .ignoresSafeArea()
        .onAppear {
            if !progresses.contains(where: { $0.id == book.id }) {
                modelContext.insert(BookProgress(book: book))
            }
        }
        
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                guard let bookProgress else { return }
                navigationPath.append(.preview(book, bookProgress))
            }) {
                Text("Start reading")
                    .bold()
                    .foregroundStyle(.progress)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.BG,in:.capsule)
                    .padding(.horizontal, 32)
                    .contentShape(Rectangle())
            }
       

        }
        
        
        .safeAreaInset(edge: .top, alignment: .leading) {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 26, height: 26)
            }
            .frame(width: 44, height: 44)
            .padding(.leading, 8)
        }
    }
}

#Preview {
    BookDetailsView(
        book: .mock[2],
        navigationPath: .constant(
    []
        )
    )
}
