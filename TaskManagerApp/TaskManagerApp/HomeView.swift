
import SwiftUI
struct HomeView: View {
    @State var editing = false
    @State var edit = false
    @State var isShiking = false
    @Environment(\.self)  var Envi
    @ObservedObject var vm : TaskManagerViewModel = .init()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)],animation: .easeInOut) var tasks : FetchedResults<Task>
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    dateview(edit: $editing)
                    ForEach(tasks){ item in
                        VStack{
                            taskCard(titel: item.titel ?? "", descriptiont: item.descriptiont ?? "" , iconename: item.icon ?? "" , colorname: item.color ?? "" ,
                                     dateDate: (item.deadline ?? Date()).formatted(date:.long,time: .omitted),
                                     dataTime: (item.deadline ?? Date()).formatted(date: .omitted, time: .shortened))
                            .overlay(alignment: .bottomTrailing, content: {
                                if editing {
                                    Button(action: {
                                        editing.toggle()
                                        if vm.deletTask(task: item, context: Envi.managedObjectContext){
                                            
                                        }
                                        Envi.dismiss()
                                    }, label: {
                                        Image(systemName: "trash")
                                            .font(.title2)
                                            .foregroundColor(.red)
                                            .offset(y: isShiking ? -3 : 3)
                                    })
                                    .padding(5)
                                    
                                }
                            })
                        }
                        
                    }
                    
                    
                }
                
            }
            .padding(10)
            .overlay(alignment: .bottom, content: {
                Button(action: {
                    vm.resrText()
                    vm.newtaskview.toggle()
                }, label: {
                    Text("New Task")
                        .foregroundColor(.white)
                        .padding(.vertical,12)
                        .padding(.horizontal)
                        .background(.black,in: Capsule())
                    
                })
            })
            .sheet(isPresented: $vm.newtaskview, content: {
                AddTaskView()
                    .environmentObject(vm)
            })
        }
        .navigationBarItems(leading:Button(action: {
            editing.toggle()
            withAnimation( Animation.default.speed(2).repeatForever(autoreverses: true).delay(0.2)){
                self.isShiking.toggle()
               
            }
        }, label: {
            Image(systemName: "square.and.pencil.circle.fill")
                .font(.title2)
                .foregroundColor(.yellow)
        }))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
