
import SwiftUI
 
struct ModalTaskSelector: View {
    @State var show = false
    let options = [
        TaskOption(icon: "checklist", title: "Task", subtitle: "A one-time task to complete", action: {}),
        TaskOption(icon: "folder", title: "Project", subtitle: "A long-term collection of tasks", action: {}),
        TaskOption(icon: "person.2", title: "Team", subtitle: "A collaborative workspace", action: {})
    ]
    var body: some View {
        ZStack{
            Color.gray.opacity(0.4).ignoresSafeArea()
            ZStack{
                ZStack{
                    HStack(spacing:18){
                        ForEach(options) { option in
                            TaskCardView(option: option)
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        show.toggle()
                                    }
                                }
                        }
                    }
                    .opacity(show ? 1 : 0)
                    .scaleEffect(show ? 1 : 0)
                }
                .frame(height: show ? 130 : 0)
                .frame(maxWidth: show ? .infinity : 0)
                .padding(show ? 16 : 0)
                .background {
                    RoundedRectangle(cornerRadius: 18)
                        .modeBasedCardStyle()
                }
                OpenBuuton(show: $show)
                
            }
            .scaleEffect(0.8)
        }
    }
}
#Preview {
    ModalTaskSelector()
}

 
















//
//
//
//import SwiftUI
//
//import SwiftUI
//
//struct TaskOption: Identifiable {
//    let id = UUID()
//    let icon: String
//    let title: String
//    let subtitle: String
//}
//struct TaskCardView: View {
//    var option: TaskOption
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 18)
//                .frame(width: 120, height: 125)
//                .modeBasedCardStyle()
//            //            drakrec()
//            VStack(spacing: 10) {
//                Image(systemName: option.icon)
//                    .font(.system(size: 13, weight: .semibold))
//                    .foregroundColor(.primary)
//                    .padding(10)
//                    .background(
//                        Circle()
//                            .modeBasedCardStyle(darkShadowOpacity: 0.2, darkShadowRadius: 10, darkShadowX: 10, darkShadowY: 10)
//                        
//                    )
//                
//                VStack(spacing: 4){
//                    Text(option.title)
//                        .font(.system(size: 15))
//                    Text(option.subtitle)
//                        .font(.system(size: 11))
//                        .foregroundColor(.gray)
//                        .multilineTextAlignment(.center)
//                }
//                
//            }
//            .padding(5)
//        }
//    }
//}
//struct ModalTaskSelector: View {
//    @State var show = false
//    @Namespace var namespace
//    let options = [
//        TaskOption(icon: "checklist", title: "Task", subtitle: "A one-time task to complete"),
//        TaskOption(icon: "folder", title: "Project", subtitle: "A long-term collection of tasks"),
//        TaskOption(icon: "person.2", title: "Team", subtitle: "A collaborative workspace")
//    ]
//    var body: some View {
//        ZStack{
//            Color.BG.ignoresSafeArea()
//            ZStack{
//                if show{
//                    Button(action: {
//                        withAnimation {
//                            show.toggle()
//                        }
//                    }) {
//                        Image(systemName: "plus")
//                            .matchedGeometryEffect(id: "icon", in: namespace)
//                            .rotationEffect(.degrees(45))
//                            .font(.largeTitle)
//                    }
//                        .offset(y:  show ? 130 : 0)
//                        .tint(.primary)
//                }
//                ZStack{
//                    HStack(spacing: 18) {
//                        ForEach(options) { option in
//                            TaskCardView(option: option)
//                                .onTapGesture {
//                                    withAnimation {
//                                        show.toggle()
//                                    }
//                                }
//                        }
//                    }
//                    .opacity(show ? 1 : 0)
//                    .scaleEffect(show ? 1 : 0)
//                    if !show{
//                        Button(action: {
//                            withAnimation {
//                                show.toggle()
//                            }
//                        }) {
//                            Image(systemName: "plus")
//                                .matchedGeometryEffect(id: "icon", in: namespace)
//                                .font(.largeTitle)
//                            
//                        }
//                        .contentShape(Rectangle())
//                        .tint(.primary)
//                    }
//                  
//                }
//                .frame(height: show ? 130  : 50)
//                .frame(maxWidth: show ? .infinity : 50)
//                .padding(16)
//                .background(
//                    RoundedRectangle(cornerRadius: 24 )
//                        .modeBasedCardStyle()
//                        .animation(.spring, value: show)
//                    
//                )
//            }
//            .scaleEffect(0.8)
//        }
//    }
//}
//#Preview(traits: .sizeThatFitsLayout) {
//    ModalTaskSelector()
//    
//    
//}
//
////Button(action: {}) {
////    Image(systemName: "xmark")
////        .font(.headline)
////        .padding()
////        .background(Color.gray.opacity(0.2))
////        .clipShape(Circle())
////}
