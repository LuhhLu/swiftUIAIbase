 
import SwiftUI

struct MyTasksView: View {
    let mytasks: FetchedResults<MyTask>
    var columns:[GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        NavigationView{
            if mytasks.isEmpty{
                Text("No Tasks found")
            }else{
                ScrollView{
                    LazyVGrid(columns: columns, content: {
                        ForEach(mytasks){ mytask in
                            RoundedRectangle(cornerRadius: 22)
                                .overlay(alignment: .leading, content: {
                                    VStack(alignment: .leading, spacing: 10){
                                        Text(mytask.titel ?? "")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            .minimumScaleFactor(1)
                                            .padding(.top)
                                            .padding(.bottom,5)
                                            .frame(width: 150, height: 40, alignment: .leading)
                                        Text(mytask.note ?? "no note")
                                            .foregroundColor(.gray)
                                            .font(.custom("Courier", size: 15))
                                            .multilineTextAlignment(.leading)
                                            .frame(width: 150, height: 180)
                                        
                                     MyTodolistDitailView(mytask: mytask)
                                    }
                                    .padding(.leading,5)
                                    
                                })
                                .frame(width: 180, height: 350)
                                .foregroundColor(Color("BC"))
                        }
                    })
                }
            }
        }
       
    }
}

 
