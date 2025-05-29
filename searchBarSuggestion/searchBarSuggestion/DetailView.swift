
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var vm: frameWC
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 30){
                Image(vm.selectedItem?.image ?? "kit1").resizable()
                    .scaledToFill().frame(width: 200, height: 200)
                    .frame(maxWidth: .infinity)
                Text(vm.selectedItem?.name ?? "Unknown").bold().font(.largeTitle)
                Text(vm.selectedItem?.titel ?? "nivalue").font(.footnote)
                Spacer()
            }
            .padding(.top,40)
            .padding(.horizontal)
        }
  
     
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(frameWC())
    }
}
