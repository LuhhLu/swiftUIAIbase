 
import SwiftUI
struct ContentView: View {
//    || vm.text == ""
    @ObservedObject var  vm = frameWC()
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 0) {
                    ForEach(framework.filter{$0.name.lowercased().contains(vm.text.lowercased()) }) { item in
                        HStack(alignment: .top, spacing: 15){
                            Image(item.image).resizable().frame(width: 50, height: 50)
                            VStack(alignment: .leading){
                                Text(item.name).bold().font(.title2)
                                Text(item.titel).font(.footnote)
                                    .frame(maxWidth: .infinity)
                                    .lineLimit(3)
                            }
                        }
                        .onTapGesture {
                            vm.showingDetail = true
                            vm.selectedItem = item
                        }

                    }
                    
                    .padding()
                    
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 20, style: .continuous))
                .sheet(isPresented: $vm.showingDetail) {
                    DetailView()
                        .environmentObject(vm)
                }
            }
            .padding()
            .background(
                Image("il").resizable().scaledToFill()
                    .frame(width: 300, height: 300)
                    .offset(y: -150)
            )
            
        }
        .searchable(text: $vm.text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("search")){
            if vm.text.isEmpty{
                ForEach(framework) { item in
                    Button {
                        vm.text = item.name
                    } label: {
                        Text(item.name)
                            .foregroundColor(.gray)
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
