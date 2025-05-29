
//Button(action: {
//    do{
//        try CoreDataService.deleteAllData()
//    }catch{
//
//    }
//
//}, label: {
//    Text("Delet")
//})

import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: [])
    var mytaskResults:FetchedResults<MyTask>
    @State var isPresented:Bool = false
    var body: some View {
  
             
        MyTasksView(mytasks: mytaskResults)
            .overlay(alignment: .bottomTrailing, content: {
                Button(action: {
                    isPresented = true
                }, label: {
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                           Circle()
                            .stroke(lineWidth: 3)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green,.blue]), startPoint: .top, endPoint: .bottom))
                            .blur(radius: 2)
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    .padding(10)
                })
            })
                .sheet(isPresented: $isPresented, content: {
                    AddNewTaskView()
                        .presentationDetents([.fraction(0.40)])
                        .presentationDragIndicator(.visible)
                })
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
         
    }
}











