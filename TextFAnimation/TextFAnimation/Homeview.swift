 
import SwiftUI
struct Homeview: View {
    @State var step: Int = 0
    let transtion:AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        switch step {
        case 0,1,2:
            ContentView(step: $step)
                .transition(transtion)
        case 3 :
            Text("HomeView")
                .frame(width: UIScreen.main.bounds.width)
                .transition(transtion)
                
        default:
            Text("NoView")
        }
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
