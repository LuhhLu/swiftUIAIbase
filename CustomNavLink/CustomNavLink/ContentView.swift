 
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to navLink view") {
                NavView()
            }
           
        }
    }
}

#Preview {
    ContentView()
}
struct NavView: View {
    @State var yOffset:Double = 0
    var body: some View {
        CustomNavLinkView(title: "CustomNavLink") {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                ForEach(0 ..< 20) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 150)
                        .foregroundStyle(.red.gradient)
                        
                }
            })
            .padding(.horizontal,20)
                    
        }
        
        
    }
}

struct ScrollOffsetKey:PreferenceKey{
    static var defaultValue:CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct CustomNavLinkView<Content:View>: View {
    @Environment(\.dismiss) var dismiss
    var title:String
    var content:Content
    @State var Yoffset:CGFloat = 0
    init(title: String,@ViewBuilder content: () -> Content ) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        ScrollView{
            VStack{
                content
                
            }
            .background(
                GeometryReader { geometry in
                    Color.clear.preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .global).minY)
                   
                }
            )
            .safeAreaPadding(.top)
        }
        .onPreferenceChange(ScrollOffsetKey.self, perform: { value in
//            Yoffset = value / 50
            Yoffset = max(0.8 ,min(1,value / 100))
        })
        
              
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            })
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(title).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .scaleEffect(Yoffset)
                }
            })
        
    }
    private var backButton: some View {
        Button(action: {
             dismiss()
        }) {
            Image(systemName: "chevron.left").bold().foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(.ultraThinMaterial, in: Circle())
                .scaleEffect(Yoffset)

        }
    }

}

