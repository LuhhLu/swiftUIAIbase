

import SwiftUI
enum CircleState:Int{
    case empty = 0
    case first
    case second
    case last
}
struct ContentView: View {
    @State var circleStata:CircleState = .empty
    @State var onbordingview:Int = 0
    @State var widthi : CGFloat = 0
    let  transetion: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack{
            ZStack{
                switch onbordingview{
                case 0:
                    FirstView()
                        .transition(transetion)
                case 1:
                    SecondView()
                        .transition(transetion)
                case 2:
                    TherdView()
                        .transition(transetion)
                default:
                    Text("Finish").bold()
                        .font(.largeTitle)
                        .transition(transetion)
                        .frame(maxWidth: .infinity)
                }
            }
            VStack{
                ZStack(alignment: .leading){
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 5,dash: [7]))
                    .frame(width: 350, height: 3)
                    .clipped()
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: widthi, height: 5)
                    HStack(spacing: 133){
                      
                            ForEach(0 ..< 3) { index in
                                ZStack{
                                    Circle()
                                        .stroke(lineWidth: 6)
                                    .frame(width: 30)
                                    .overlay {
                                        Circle()
                                            .foregroundColor(circleStata.rawValue > index ? .black : .white)
                                    }
                                    Text("\(index + 1)")
                                        .font(.body)
                                        .foregroundColor(circleStata.rawValue > index ? .white : .black)
                                }
                              
                            }
                        
                        
                    }
                }
                
                Spacer()
                Button {
                    withAnimation (.spring()){
                        onbordingview += 1
                        switch circleStata {
                        case .empty:
                            circleStata = .first
                            widthi += 162
                        case .first:
                            circleStata = .second
                            widthi += 162
                        case .second:
                            circleStata = .last
                            if widthi <= 324{
                                widthi += 20
                            }
                            
                        case .last:
                            print("dane")
                        }
                    }
                } label: {
                    HStack{
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundColor(.white.opacity(0.7))
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding()
            }
           

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
struct FirstView: View {
    @State var text = ""
    var body: some View {
        VStack{
            Text("What is your name??").bold()
                .font(.largeTitle)
            Text("the name will be you user namae fo ever")
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3)
                .frame(width: 320, height: 50)
                .overlay {
                    TextField("Your name...", text: $text)
                        .padding(.horizontal)
                        .frame(height: 50)
                }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SecondView: View {
    @State var text = ""
    var body: some View {
        VStack{
            Text("Your Email").bold()
                .font(.largeTitle)
            Text("We will contact you through this mail")
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3)
                .frame(width: 320, height: 50)
                .overlay {
                    TextField("Your email...", text: $text)
                        .padding(.horizontal)
                        .frame(height: 50)
                }
        }
        .frame(maxWidth: .infinity)
    }
}
 
struct TherdView: View {
    var body: some View {
        VStack{
            Text("Welcome SuCodee to onboarding App").bold()
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity)
    }
}
