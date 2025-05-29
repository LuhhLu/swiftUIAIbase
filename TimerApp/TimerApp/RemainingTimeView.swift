 

import SwiftUI

struct RemainingTimeView: View {
    var remainingTime: String
    var endDate: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "bell.fill")
                Text(endDate)
            }
            Text(remainingTime)
                .font(.largeTitle)
        }
    }
}

#Preview {
    RemainingTimeView(remainingTime: "34:40", endDate: "02:32")
}
