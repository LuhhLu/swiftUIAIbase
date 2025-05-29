
import SwiftUI

struct BuyOutView: View {
    var body: some View {
        VStack(alignment:.leading){
      
            Image(.jacket).resizable().scaledToFill()
                .frame(height: 400)
                .clipShape(.rect(cornerRadius: 30))
                .ignoresSafeArea()
            Spacer()
            VStack(alignment:.leading,spacing:24){
                
                Text("Bomber Jacket")
                    .font(.title.bold())
                    Text("$59.00")
                        .font(.title.bold())
                
                CSelectionOne()
                SizeSelectionView()
                Button {
                    //
                } label: {
                    Text("Buy Now").bold()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue,in:.capsule)
                }
                .tint(.white)
                .padding(.vertical)
                .padding(.bottom)
                
            }
            .padding(.horizontal)
            

        }
        
    }
}

#Preview {
    BuyOutView()
}
