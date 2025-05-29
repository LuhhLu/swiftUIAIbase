 

import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage("add", store: UserDefaults(suiteName: "group.Sucodee.TDWidget.TaskWidget"))
    var addone: Int = 0

    var body: some View {
        VStack (spacing:40){
            ZStack {
                Circle()
                    .stroke(lineWidth: 24)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                Circle()
                    .stroke(lineWidth: 0.34)
                    .frame(width: 175, height: 175)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3),.clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .overlay {
                        Circle()
                            .stroke(.black.opacity(0.1),lineWidth: 2)
                            .blur(radius: 5)
                            .mask {
                                Circle()
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.clear]),
                                                                    startPoint: .topLeading,
                                                                    endPoint: .bottomTrailing))
                            }
                    }

                Circle()
                    .trim(from: 0, to: CGFloat(addone) / 100)
                    .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round))
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing))
                    .animation(.spring(), value: addone)
                Text("\(addone)%").bold().font(.largeTitle)
            }
         
            HStack( spacing:60) {
                Button(action: {
                   addone = max(addone - 5 ,0)
                    WidgetCenter.shared.reloadAllTimelines()
                    
                }, label: {
                    Image(systemName: "minus").font(.title)
                   
                })
                Button(action: {
                    addone = min(addone + 5 ,100)
                     WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Image(systemName: "plus").font(.title)
                    
                })
            }
        }
        .font(.largeTitle)
        .padding()
    }

}

#Preview {
    ContentView()
}

