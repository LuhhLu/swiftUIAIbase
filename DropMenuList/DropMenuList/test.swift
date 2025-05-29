 

import SwiftUI

struct test: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
                .foregroundStyle(.red)
                .zIndex(1)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
                .foregroundStyle(.yellow)
            
        }
        
    }
}

#Preview {
    test()
}
