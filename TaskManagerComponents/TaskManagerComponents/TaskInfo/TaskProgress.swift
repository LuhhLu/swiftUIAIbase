 

import SwiftUI

struct TaskProgress: View {
    var taskTitle: String = "UI Design"
    var progress: Double = 0.75
    var daysRemaining: String = "6 Day"

    var body: some View {
        ZStack(alignment:.bottom){
            Color(.systemGray6)
            VStack{
                HStack{
                    Spacer()
                    Text(daysRemaining)
                        .font(.callout.bold())
                        .padding(8)
                        .background(Color(.systemGray4),in:.capsule)
                    
                }
                Spacer()
                Text(taskTitle)
                    .font(.title2.bold())
                Spacer()
                VStack(alignment:.leading){
                    Text("Progress")
                        .foregroundStyle(.gray)
                    ProgressView(value: progress)                     
                    HStack{
                        Spacer()
                        Text("\(Int(progress * 100))%")
                    }
                }
                .font(.title3.bold())
                .padding(.bottom)
                Spacer()
            }
            .padding(10)
            Image(.wave).renderingMode(.template)
                .resizable().scaledToFit()
                .foregroundStyle(Color(.systemGray4))
                .frame(height: 40)
                .offset(y: 3)
            
        }
        .frame(width: 200, height: 250)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    TaskProgress()
}

 
