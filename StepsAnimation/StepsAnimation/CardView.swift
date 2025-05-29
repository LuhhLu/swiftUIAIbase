 
import SwiftUI

struct CardView: View {
    var vm:DataModel
    var body: some View {
        VStack{
            ZStack{
                Circle().trim(from: 0, to: 0.95)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(-20))
                Image(systemName: vm.icon)
                    .font(.system(size: 70))
            }
            Text(vm.title).font(.title.bold())
            Text(vm.details)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.top)
        }
        .foregroundStyle(.white)
        .padding()
        .frame(width: 300, height: 350)
        .background(.BG,in:.rect(cornerRadius: 20))
        .tag(vm.tag)
    }
}

#Preview {
 PageView()
}
