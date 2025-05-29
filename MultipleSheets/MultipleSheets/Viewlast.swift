

import SwiftUI

struct Viewlast: View {
    var body: some View {
        ZStack{
            Color("C5")
            Text("The End")
                .frame(width: 150, height: 80).background(.thinMaterial,in:RoundedRectangle(cornerRadius: 20))
                .foregroundColor(.black).bold().font(.title2)
        }
        .ignoresSafeArea()
       
    }
}

struct Viewlast_Previews: PreviewProvider {
    static var previews: some View {
        Viewlast()
    }
}
