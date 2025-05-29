
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm :Manager
    @State var showAddView = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink {
                      CardListView()
                    } label: {
                        Image(systemName: "square.stack")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button {
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }


                }
                .padding()
                TabView {
                    ForEach(vm.questionList) { items in
                        CardView(name: items.name, question: items.question, answer: items.answer)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .onAppear{
                vm.fetchData()
            }
            .sheet(isPresented: $showAddView) {
                AddNewCardView( Showaddview: $showAddView)
                    .presentationDetents([.fraction(0.45)])
                    .presentationDragIndicator(.visible)
                
            }
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Manager())
    }
}
