 

import SwiftUI

struct ProgressView: View {
    var vm:Model
    var body: some View {
        HStack {
            ZStack{
                Circle()
                    .stroke(lineWidth: 8)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.gray.opacity(0.1))
                Circle()
                    .trim(from: 0, to: Double(vm.completed) / Double(vm.tasks))
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue.opacity(0.4))
                    .rotationEffect(.degrees(-90))
                VStack(spacing:3){
                    Text("\(vm.tasks - vm.completed)").font(.system(size: 40))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 30, height: 3)
                        .foregroundStyle(.red.opacity(0.4))
                }
                .offset(y: -4)
            }
            Spacer()
            VStack(alignment:.leading){
                Text("Weekly progress").font(.system(size: 17)).bold()
                Group{
                    HStack{
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.blue.opacity(0.4))
                        Text("Complete task")
                            .font(.system(size: 14))
                    }
                    HStack{
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.red.opacity(0.4))
                        Text("Remaini task")
                            .font(.system(size: 14))
                    }

                }
                .offset(x: 10)
            }
            
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 1, height: 100)
                .foregroundStyle(.gray.opacity(0.3))
                .offset(x: -7)
        }
    }
    
   

}

#Preview {
    ProgressView(vm: Model())
}
