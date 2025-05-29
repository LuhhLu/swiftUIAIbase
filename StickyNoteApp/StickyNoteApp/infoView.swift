 
import SwiftUI

struct infoView: View {
    var vm:Model
    @StateObject var timerViewModel = TimeViewModel()
    var body: some View {
        VStack(spacing:37){
            VStack(alignment:.leading,spacing: 10){
                Text(Date().formatted(.dateTime.day()))
                    .font(.system(size: 110))
                    .frame(height: 100)
                Text("\(vm.tasks - vm.completed) Availble task").bold()
                Text(Date().formatted(.dateTime.weekday(.wide)))
                
            }
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 130, height: 1)
                .foregroundStyle(.gray.opacity(0.3))
                .offset(y: 8)
            VStack(alignment:.leading,spacing: 10){
                Text(timerViewModel.currentTime).font(.system(size: 33))
                Text("Last task is...").bold()
                if vm.notes.isEmpty{
                    Text("No task yet all you need is to addd new one")
                        .font(.custom("PatrickHand-Regular", size: 14))
                         .frame(width: 120, height: 52, alignment: .topLeading)
                         .font(.footnote)
                }
                if let lastnote = vm.notes.last{
                    Text(lastnote.note)
                        .font(.custom("PatrickHand-Regular", size: 14))
                         .frame(width: 120, height: 52, alignment: .topLeading)
                         .font(.footnote)
                    
                }
               
            }
            .frame(height: 150)
         
        }
    }
}

#Preview {
//    infoView()
    TimeBoardView()
}


import Foundation
import Combine

class TimeViewModel: ObservableObject {
    @Published var currentTime: String = ""
    private var timer: AnyCancellable?

    init() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
        updateTime()
    }
    
    private func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a" // 12-hour format with am/pm
        currentTime = dateFormatter.string(from: Date())
    }
}
