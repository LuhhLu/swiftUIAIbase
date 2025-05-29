 


import SwiftUI

struct ContentView: View {
    @State var enteredPassword = ""
    @State var isPasswordCorrect = false
    @State var shakeOffset: CGFloat = 0
    let secretCode = "123456"
    var body: some View {
        if isPasswordCorrect{
            HomeView()
        }else{
            VStack {
                Spacer()
                user()
                Spacer()
                thecode
                Spacer()
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                KeypadView(enteredPassword: $enteredPassword, style: .square, secretCode: secretCode, isPasswordCorrect: $isPasswordCorrect, shakeOffset: $shakeOffset)
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                    .offset(x: shakeOffset)
                    .animation(.linear, value: shakeOffset)
                Button(action: {}, label: {
                    Text("Forgot your passcode?")
                })
            }
            .padding()
        }
 
    }
    var thecode:some View{
        HStack(spacing:20){
            ForEach(0..<secretCode.count,id: \.self){ index in
                Circle().foregroundStyle(index < enteredPassword.count ? .blue : .gray)
                    .frame(width: 15, height: 15)
                
            }
        }
        .offset(y: 10.0)
    }
}

#Preview {
    ContentView()
}














struct user: View {
    var body: some View {
        ZStack{
            Circle().frame(width: 80, height: 80).foregroundStyle(.gray.opacity(0.3))
            Text("SC").font(.title)
        }
        Text("Good evening, Sucodee")
            .font(.title)
            .offset(y: 10)
    }
}
struct KeypadView: View {
    @Binding var enteredPassword: String
    let style: KeypadStyle
    let secretCode: String
    @Binding var isPasswordCorrect: Bool
    @Binding var shakeOffset: CGFloat
    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["faceid", "0", "delete.left"]
    ]
    var body: some View {
        VStack{
            ForEach(numbers,id: \.self){ row in
                HStack{
                    ForEach(row,id:\.self){ item in
                        Button(action: {handleButtonPress(item: item)}, label: {
                            if item == "faceid" || item == "delete.left"{
                                Image(systemName: item)
                                    .font(.title)
                                    .frame(width: 100, height: 80)
                                    .padding(5)
                            }else{
                                Text(item).font(.largeTitle)
                                    .frame(width: 100, height: 80)
                                    .background(backgroundShape(for: style))
                                    .padding(5)
                                
                            }
                        })
                        .tint(.primary)
                        
                    }
                }
                
            }
        }
    }
    @ViewBuilder
    func backgroundShape(for style:KeypadStyle) -> some  View{
        switch style {
        case .circle:
            Circle().fill(.gray.opacity(0.2))
        case .square:
            RoundedRectangle(cornerRadius:8).fill(.gray.opacity(0.2))
        case .regular:
            Color.clear
        }
    }
    func handleButtonPress (item:String){
        switch item {
            
        case "faceid":
            //action
            break
        case "delete.left":
            if !enteredPassword.isEmpty{
                enteredPassword.removeLast()
            }
        default:
            enteredPassword.append(item)
        }
        if enteredPassword.count == secretCode.count {
            if enteredPassword == secretCode {
                isPasswordCorrect = true
            }else{
                shakeOffset = 7
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    shakeOffset = -15
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                    shakeOffset = 0
                    enteredPassword = ""
                    
                }
            }
        }
    }
}
struct HomeView: View {
    var body: some View {
        Text("Your View").font(.largeTitle.bold())
    }
}
enum KeypadStyle {
    case circle
    case square
    case regular
}
