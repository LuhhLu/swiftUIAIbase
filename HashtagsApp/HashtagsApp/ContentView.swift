
import SwiftUI
import UIKit
struct ContentView: View {
    @State var categoris = [
        ("SwiftUI App Programming", ["#SwiftUI", "#AppDevelopment", "#iOS", "#MobileApp", "#UserInterface", "#DataBinding", "#StateManagement"]),
        ("Animation Programming", ["#CSSAnimations", "#JavaScriptAnimations", "#HTML5Canvas", "#WebAnimations", "#AnimationLibraries"]),
        ("Game Development", ["#GameDev", "#Unity", "#UnrealEngine", "#IndieGames", "#GameDesign", "#3DModeling", "#Texturing", "#Scripting", "#LevelDesign"]),
    ]
    let catecoryIcons: [String: String] = [
        "SwiftUI App Programming": "iphone",
        "Animation Programming": "cursor.rays",
        "Game Development": "gamecontroller"
    ]
    @State var copyStates:[String: Bool] = ["SwiftUI App Programming": false,
                                            "Animation Programming": false,
                                            "Game Development": false]
    var body: some View {
        ScrollView {
            ForEach(categoris,id: \.0) { category , hashtags in
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: catecoryIcons[category] ?? "questionmark")
                            Text(category)
                            .font(.title3)
                        
                    }
                    .padding([.horizontal,.top])
                    FlowStack(items: hashtags) { hashtag in
                        Text(hashtag)
                            .font(.system(size: 15))
                            .padding(8)
                            .background(.gray.opacity(0.07))
                            .cornerRadius(8)
                        
                    }
                    .padding()
                }
                .background(.white)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                .padding()
                .overlay(alignment: .topTrailing) {
                    Button {
                        copyToClipboard(hashtags)
                        withAnimation {
                            copyStates[category]?.toggle()
                        }
                    } label: {
                        ZStack{
                            Circle()
                                .stroke(lineWidth: 2)
                                .frame(width: 35)
                            Image(systemName: copyStates [category] ?? false ? "checkmark" : "doc.on.doc" ).bold()
                        }
                        .foregroundColor(copyStates [category] ?? false ? .green : .gray )
                    }
                    .offset(x: -25, y: 25)
                }
            }
        }
    }
    func copyToClipboard(_ hashtags:[String]){
        let pastebboard = UIPasteboard.general
        pastebboard.string = hashtags.joined(separator: " ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct FlowStack<Context:View>: View {
    let items:[String]
    let viewForItem:(String) -> Context
    init(items: [String], viewForItem: @escaping (String) -> Context) {
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader { geometry in
            self.generateContext(in: geometry)
        }
    }
    func generateContext(in g :GeometryProxy) -> some View{
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading){
            ForEach(self.items,id: \.self) { item in
                self.viewForItem(item)
                    .padding([.horizontal,.vertical],4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if(abs(width - d.width) > g.size.width){
                            width = 0
                            height -= d.height
                        }
                        let resulte = width
                        if item == self.items.last!{
                            width = 0
                        }else{
                            width -= d.width
                        }
                        return resulte
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if item == self.items.last!{
                            height = 0
                        }
                        return result
                    })
            }
            
        }
    }
}
 
