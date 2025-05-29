
    import SwiftUI
    import Observation
    @Observable class AddedItems{
         var items: [dataModel] = []
    }
    struct HLayout: View {
        var addedItems = AddedItems()
        var vm:dataModel
        var namespace : Namespace.ID
        var body: some View {
            HStack{
                Image(vm.image).resizable().scaledToFill()
                    .matchedGeometryEffect(id: vm.image, in: namespace)
                    .frame(width:60, height: 60)
                    .padding(.leading,7)
                VStack(alignment:.leading,spacing: 10){
                    Text(vm.name)
                    HStack{
                        Text(vm.prase)
                        Spacer()
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundStyle(.yellow)
                            Text(vm.rating)
                                .padding(.trailing,75)
                    }
                }
                .foregroundStyle(.primary)
            }
            .frame(height: 70)
            .background(.shapeC,in:.rect(cornerRadius: 15))
            .overlay(alignment: .trailing) {
                Button(action: {
                    if let index = addedItems.items.firstIndex(of: vm) {
                          addedItems.items.remove(at: index)
                      } else {
                          addedItems.items.append(vm)
                      }
                }, label: {
                    Image(systemName: addedItems.items.contains(vm) ? "checkmark" : "plus").font(.title2)
                        .contentTransition(.symbolEffect)
                        .frame(width: 50, height: 50)
                        .background(.gray.opacity(0.2),in: .rect(cornerRadius: 15))
                        .padding(.trailing,10)
                })
                .foregroundStyle(.primary)
               
            }
        }
    }


    #Preview {
        HomeView()
//        ContentView(addedItems: AddedItems())
//        HLayout(vm: dataModel(image: "", name: "", prase: "", rating: ""))
    }

 
