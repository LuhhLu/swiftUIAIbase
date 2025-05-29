 

import SwiftUI
struct ContentView: View {
    var addedItems = AddedItems()
    var vm:[dataModel] = [
        dataModel(image: "french fries", name: "French Fries", prase:"$07:25", rating: "4.50"),
        dataModel(image: "Doughnut", name: "Doughnut", prase:"$10:00", rating: "3.51"),
        dataModel(image: "Hamburger", name: "Hamburger", prase:"$12:50", rating: "5.00"),
        dataModel(image: "Hotdog", name: "Hotdog", prase:"$01:15", rating: "3.52"),
        dataModel(image: "Sandwich", name: "Sandwich", prase:"$08:00", rating: "4.54"),
        dataModel(image: "Sushi", name: "Sushi", prase:"$15:50", rating: "4:20"),
        dataModel(image: "Pizza", name: "Pizza", prase:"$12:50", rating: "3.52"),
        dataModel(image: "Meat", name: "Meat", prase:"$18:22", rating: "2.54"),
        dataModel(image: "Taco", name: "Taco", prase:"$05:00", rating: "4:01"),
        dataModel(image: "Lollipop", name: "Lollipop", prase:"02:50", rating: "3.52")
      
    ]
    @Namespace var namespace
    @State var text = ""
    @State private var searchText = ""
    @Binding var show:Bool
    @State var listView = false
    var filteredView: [dataModel] {
           guard !searchText.isEmpty else { return vm }
           return vm.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
       }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
                    VStack(spacing:23){
                        HStack{
                            Button {
                                withAnimation {
                                    show.toggle()
                                }
                            } label: {
                                Image(systemName: "line.horizontal.3.decrease").font(.title)
                            }
                                Spacer()
                                Text("HI SUCODEE ").font(.title)
                                Spacer()
                                Image(.pro).resizable().scaledToFill()
                                    .frame(width: 50, height: 50)
                                  
                            }
                        .foregroundStyle(.primary)
                            HStack{
                                CustomSearchView(text: $searchText)
                                Button(action: {
                                    withAnimation {
                                        listView.toggle()
                                    }
                                }, label: {
                                    Image(systemName:listView ? "rectangle.grid.2x2.fill":"rectangle.grid.1x2.fill")
                                        .font(.title)
                                        .contentTransition(.symbolEffect)
                                })
                                .foregroundStyle(.gray)
                                .frame(width: 40, height: 50)
                            }
                                if !listView{
                                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing: 12) {
                                        ForEach(filteredView,id: \.self) { item in
                                            GridLayout(addedItems: addedItems,vm: dataModel(image: item.image, name: item.name, prase: item.prase, rating: item.rating), namespace: namespace)
                                        }
                                    }
                                    
                                }
                                if listView{
                                    LazyVGrid(columns: Array(repeating: GridItem(), count: 1)) {
                                        ForEach(filteredView,id: \.self) { item in
                                            HLayout(addedItems: addedItems, vm: dataModel(image: item.image, name: item.name, prase: item.prase, rating: item.rating), namespace: namespace)
                                        }
                                    }
                                    
                                }
                        }
                    .animation(.spring, value: searchText)
                    .safeAreaPadding(.horizontal,12)
            }
            .padding(.top,55)
            .background(.BC)
            .safeAreaPadding(.bottom,50)
//        }
 
    }
}

#Preview {
//    ContentView()
    HomeView()
}
struct CustomSearchView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading)
            TextField("Search restaurant", text: $text)
        }
        .frame(height: 45)
        .background(.ultraThinMaterial,in: .rect(cornerRadius: 15))
    }
}
