 
import SwiftUI

struct scrollView: View {
    @GestureState private var dragState = DragState.inactive
    @State var viewHeight:CGFloat = 350
    @State var isopen = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(.white)
                        .frame(width: isopen ? 70 : 0, height: 5)
                        .offset(y: isopen ? -10 : 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(.white.opacity(0.8))
                        ScrollView{
                            VStack{
                                ForEach(0 ..< 15) { item in
                                   ShapePath()
                                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                                        .padding(10)
                                }
                            }
                        }
                        .padding(.top)
                    }
                    .clipped()
                }
                .frame(width: UIScreen.main.bounds.width - 10)
                .frame(height: viewHeight)
               
                .gesture(
                    DragGesture()
                        .updating($dragState){ drag, state
                            , transaction in
                            state = .dragging(translation: drag.translation)
                        }
                        .onEnded(onDragEnded)
                )
                .animation(.spring(), value: self.viewHeight)
            }
        }
    }
    func onDragEnded(drag:DragGesture.Value){
        let verticalDirection = drag.predictedEndTranslation.height
        if verticalDirection < 0 {
            viewHeight = 700
            withAnimation(.easeInOut(duration: 0.3).delay(1)) {
                isopen = true
            }
        }else{
            viewHeight = 350
            withAnimation(.easeInOut(duration: 1).delay(1)) {
                isopen = false
            }
        }
        
    }
    enum DragState {
        case inactive
        case dragging(translation:CGSize)
        var translation:CGSize{
            switch self{
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        scrollView()
    }
}
