

import SwiftUI

struct pageview: View {
    var body: some View {
        TabView(content: {
            Image("M1")
                .resizable()
                .scaledToFill()
            Image("M2")
                .resizable()
                .scaledToFill()
            Image("M1")
                .resizable()
                .scaledToFill()
        })
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: 400)
         
    }
}

struct pageview_Previews: PreviewProvider {
    static var previews: some View {
        pageview()
    }
}
