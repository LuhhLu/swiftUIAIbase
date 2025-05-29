 
import SwiftUI
struct GridLayout: View {
    var addedItems = AddedItems()
    var vm:dataModel
    var namespace : Namespace.ID
    var body: some View {
        VStack{
            Spacer()
            Image(vm.image).resizable().scaledToFill()
                .matchedGeometryEffect(id: vm.image, in: namespace)
                .frame(width: 90, height: 90)
            VStack(alignment:.leading,spacing:12){
                Text(vm.name).bold()
                HStack{
                    Text(vm.prase)
                    Spacer()
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundStyle(.yellow)
                    Text(vm.rating)
                }
            }
            .foregroundStyle(.primary)
            .padding(.bottom,12)
            .padding(.horizontal)
        }
      
        .frame(width: 175, height: 195)
        .background(.shapeC,in:.rect(cornerRadius: 15))
        .overlay(alignment: .topTrailing) {
            Button(action: {
                if let index = addedItems.items.firstIndex(of: vm) {
                      addedItems.items.remove(at: index)
                  } else {
                      addedItems.items.append(vm) 
                  }
            }, label: {
                Image(systemName: addedItems.items.contains(vm) ? "checkmark" : "plus").font(.title2)
                    .contentTransition(.symbolEffect)
                    .padding(10)
                    .background(.gray.opacity(0.2),in:  UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 14, bottomTrailingRadius: 0, topTrailingRadius: 15, style: .continuous))

            })
            .foregroundStyle(.primary)
           
        }
    }
}

#Preview {
//    NewLayView()
//    ContentView()
    HomeView()
}

 
