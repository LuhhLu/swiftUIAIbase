
import SwiftUI

//There are three cases: one, two, and three. Each case carries a CGFloat value, which likely corresponds to a size or position value that's relevant to the animation's behavior.
//one(CGFloat) represents the initial state of the animation, with a size or position value of 200.
//tow(CGFloat) represents the next state of the animation, with a size or position value of 120.
//thre(CGFloat) represents the final state of the animation, with a size or position value of 100
enum AnimationState {
    case one(CGFloat)
    case tow(CGFloat)
    case thre(CGFloat)
    //The mutating func next() method changes the state of the animation, cycling from one to tow, tow to thre, and thre back to one.
    mutating func next() {
        switch self {
        case .one:
            self = .tow(120)
        case .tow:
            self = .thre(100)
        case .thre:
            self = .one(200)
        }
    }
    //The resize computed property returns the CGFloat value associated with the current state.
    //case .one(let resize), case .tow(let resize), and case .thre(let resize) all bind the associated value of each case to a local variable resize, and then return it.
    var resize: CGFloat {
        switch self {
        case .one(let resize),
                .tow(let resize),
                .thre(let resize):
            return resize
        }
    }
    //The isTow and isThre computed properties are boolean checks that determine if the current state is .tow or .thre, respectively
    //isTow returns true if the current state is .tow and false otherwise.
    //isThre returns true if the current state is .thre and false otherwise.
    var isTow: Bool {
        switch self {
        case .tow:
            return true
        default:
            return false
        }
    }
    var isThre: Bool {
        switch self {
        case .thre:
            return true
        default:
            return false
        }
    }
}
struct SquareAnim: View {
    @State var animationstate : AnimationState = .one(200)
    @Binding var Height:CGFloat
    @Binding var Height2:CGFloat
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 2, style: .circular)
                .frame(width: 30, height: 20)
                .foregroundColor(.black)
              
            Rectangle()
                .frame(width: 30, height: 2)
                .offset(x: animationstate.isTow ? 0 : 30)
            Rectangle()
                .frame(width: 2, height: 20)
                .offset(y: animationstate.isTow ? 0 : 20)
            Rectangle()
                .frame(width: 2, height: 20)
                .offset(x:5,y: animationstate.isThre ? 0 : 20)
            Rectangle()
                .frame(width: 2, height: 20)
                .offset(x:-5,y: animationstate.isThre ? 0 : -20)
            Rectangle()
                .frame(width: 30, height: 2)
                .offset(x:animationstate.isThre ? 0 : 30)
            
         
 
        }
        .clipped()
        .mask({
            RoundedRectangle(cornerRadius: 5, style: .continuous)
        })
        .foregroundColor(.white)
        .onTapGesture {
            withAnimation {
                animationstate.next()
                Height = animationstate.resize
                if Height == 200{
                    Height2 = 200
                }else if Height == 120{
                    Height2 = 170
                }else{
                    Height2 = 110
                }
                
            }
        }
    }
}

struct SquareAnim_Previews: PreviewProvider {
    static var previews: some View {
        SquareAnim(Height: .constant(200), Height2: .constant(200))
    }
}
