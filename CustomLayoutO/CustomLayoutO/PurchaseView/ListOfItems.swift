 



import SwiftUI

struct ListOfItems: View {
    var vm:dataModel
    var body: some View {
         HStack{
            Image(vm.image).resizable().scaledToFill()
                 .frame(width:60, height: 60,alignment: .leading)
                .padding(.leading,7)
            VStack(alignment:.leading,spacing: 10){
                Text(vm.name)
                HStack{
                    Text(vm.prase)
                    Spacer()
             
                        Image(systemName: "star.leadinghalf.filled")
                            .foregroundStyle(.yellow)
                        Text(vm.rating)
                            .padding(.trailing)
      
                }
            }
        }
        .frame(height: 70)
        .background(.shapeC,in:.rect(cornerRadius: 15))
    }
}

//    #Preview {
//        ListOfItems(vm: dataModel(image: "ice", name: "name", prase: "21:44", rating: "4.5"))
//    }
struct newone: View {
    var addedItems = AddedItems()
    var body: some View {
            if addedItems.items.isEmpty{
                    VStack(spacing:10){
                        Spacer()
                        Image(systemName: "takeoutbag.and.cup.and.straw")
                                        .font(.system(size: 80))
                                    Text("Your basket is empty")
                                        .font(.title2)
                                    Text("Tap the + button to add food to your basket")
                            .frame(maxWidth: .infinity)
                        Spacer()
                    }
                    .background(.BC)
            }else{
                ScrollView {
                    VStack(alignment:.leading){
                        Text("Food Orders").font(.largeTitle).bold()
                            .padding(.bottom)
                            .padding(.top,70)
                            ForEach(addedItems.items,id: \.self) { item in
                                ListOfItems(vm: item)
                            }
                        Spacer()
                    }
                    .padding(.horizontal,10)
                }
                .background(.BC)
                
               
            }
    }
}

#Preview {
    HomeView()
//            newone()
}
