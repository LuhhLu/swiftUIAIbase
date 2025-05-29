

import SwiftUI

enum TextAlign: String, CaseIterable {
    case left = "text.alignleft"
    case center = "text.aligncenter"
    case right = "text.alignright"

    var alignment: TextAlignment {
        switch self {
        case .left:
            return .leading
        case .center:
            return .center
        case .right:
            return .trailing
        }
    }
}


struct ContentView: View {
    @State private var textAlignment: TextAlignment = .leading
    @State var Ttext = ""
    @FocusState var Tfocus: Bool
    @State var ntext = ""
    @FocusState var Nfocus: Bool
    @State var Xoffset = 0.0
    var body: some View {
        VStack {
            ZStack(alignment: .leading){
                 TextField("", text: $Ttext)
                    .focused($Tfocus)
                    .foregroundColor(.white).padding()
                    .frame(width: 200, height: 60)
                    .background(.black,in:RoundedRectangle(cornerRadius: 10))
                if !Tfocus && Ttext.isEmpty{
                    Text("   Task name").bold().font(.title2).foregroundColor(.white)
                        .onTapGesture {
                            Tfocus = true
                        }
                }
               
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.vertical,1)
            TextEditor(text: $ntext)
                .focused($Nfocus)
                .multilineTextAlignment(textAlignment)
                .frame(height: 180).colorMultiply(.yellow.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .topLeading) {
                    if !Nfocus && ntext.isEmpty{
                        Text("Write a note...").bold().foregroundColor(.orange).padding(8)
                    }
                }
            
            
            
            ZStack{
                RoundedRectangle(cornerRadius: 5).frame(width: 50, height: 40)
                    .foregroundColor(.gray)
                    .offset(x: -135)
                    .offset(x: Xoffset)
                HStack{
                    ForEach(Array(TextAlign.allCases.enumerated()),id: \.offset) { index,textAlign in
                        Image(systemName: textAlign.rawValue)
                            .padding(10)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    textAlignment = textAlign.alignment
                                    Xoffset = CGFloat(index) * 135
                                }
                            }
                            
                        if textAlign != TextAlign.allCases.last{
                            Spacer()
                        }
                    }
                }
            }
            .padding()
            .bold().font(.title).frame(height: 60)
            .foregroundColor(.white)
            .background(.black,in:RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
