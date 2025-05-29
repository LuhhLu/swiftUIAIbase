 

import SwiftUI

struct DataModel {
    var title: String
    var isComplet:Bool = false
}
struct ContentView: View {
    @State var tasks: [DataModel] = [
          DataModel(title: "Task 1" ),
          DataModel(title: "Task 2" ),
          DataModel(title: "Task 3" ),
          DataModel(title: "Task 4" ),
          DataModel(title: "Task 5" ),
          
      ]
    @State var show  = false
    var body: some View {
        ScrollView{
            VStack(spacing:12){
                ForEach(tasks.indices, id: \.self) { index in
                    
                    let task = tasks[index]
                    let scaleValue = 1.0 - (CGFloat(index) * 0.02)
                    let opacityValue = 1.0 - (CGFloat(index) * 0.2)
                    
                    HStack{
                        Text(task.title).strikethrough(task.isComplet, color: .white)
                        Spacer()
                        Image(systemName: task.isComplet ? "checkmark.circle.fill" : "circle")
                            .font(.title2).contentTransition(.symbolEffect)
                    }.bold()
                    .foregroundStyle(.white).padding(.horizontal)
                    .frame(height: 50).frame(maxWidth: .infinity)
                    
                    .opacity(index == 0 ? 1 : (show ? 1 : opacityValue))
    
                    .background(.thinMaterial,in: RoundedRectangle(cornerRadius: 12))
                    
                    .zIndex(Double(-1 * index))
                    
                    .scaleEffect(show ? 1 : scaleValue)
                    
                    .opacity(show ? 1 : opacityValue)
                    
                    .offset(y: CGFloat(show ? 0  * index : -56 * index ))
                }
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                        
                    }
                }
            }
            .frame(height: show ? nil : 50,alignment: .top)
 
        }
       
    }
}

#Preview {
    ContentView()
}
