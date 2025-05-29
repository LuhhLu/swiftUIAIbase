 

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            userAndCategory()
            TDEffectimage()
            TopSellers()
            TabBar()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
