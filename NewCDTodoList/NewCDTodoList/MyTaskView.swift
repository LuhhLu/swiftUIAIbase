

import SwiftUI

struct MyTaskView: View {
    let mytask:FetchedResults<MyTask>
    @State var isPresentd = false
    @State var Edit = false
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(mytask) { task in
                        ProgressView(percentage: CGFloat(task.percentage), progress: CGFloat(task.progress), width: 200, multiple: CGFloat(task.multiple), name: task.titel ?? "" )
                    }
                }
                .padding()
            }
            ScrollView(showsIndicators: false){
                ForEach(mytask) { task in
                    NavigationLink(value: task) {
                        HStack{
                            Image(systemName: task.icon ?? "house")
                                .imageScale(.medium)
                                .foregroundColor(.black)
                            Text(task.titel ?? "")
                                .foregroundColor(.black)
                                .font(.headline)
                            Spacer()
                            if Edit{
                                Button(action: {
                                    do{
                                        try CDTaskService.deletmyTask(mytask: task)
                                    }catch{
                                        
                                    }
                                }, label: {
                                    Image(systemName: "trash.square.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.yellow)
                                })
                            }else{
                                Text("\(task.items)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                                    .frame(width: 23, height: 22)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(7)
                                    
                            }
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                        .padding(.horizontal)
                    }
                   
                    .overlay(alignment:.leading,content: {
                        if Edit{
                            UpdateMyTAsk(mytask:task , Edit: $Edit)
                        }
                    })
                }
                .padding(.top,10)
                .scrollContentBackground(.hidden)
                .navigationDestination(for: MyTask.self) { mytask in
                    myToDoView(mytask: mytask)
                }
                Button(action: {
                    isPresentd.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 2)
                            .frame(width: 40, height: 25)
                            .foregroundColor(.black)
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                })
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding()
               
            }
        }
        .offset(y: 10)
        .overlay(content: {
            if isPresentd{
                AddNewTaskView(isPresented: $isPresentd)
            }
        })
        .overlay(alignment: .topTrailing, content: {
            Button {
                Edit.toggle()
            } label: {
                Image(systemName: "pencil.circle").bold()
                    .font(.title)
                    .foregroundColor(.black)
            }
            .offset(x: -10, y: -15)
        })
    }
}

//struct MyTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTaskView(mytask: <#FetchedResults<MyTask>#>)
//    }
//}
