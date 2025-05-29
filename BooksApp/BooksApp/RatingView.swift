 
import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing:5){
            Image(systemName: "star.fill").foregroundStyle(.yellow)
            Text(rating,format: .number.precision(.fractionLength(1)))
                .foregroundStyle(.primary)
        }
        .font(.caption)
        .padding(.vertical,6)
        .padding(.horizontal,8)
        .background(.gray.opacity(0.3),in:.capsule)
    }
}

#Preview {
    RatingView(rating: 3.5)
}
