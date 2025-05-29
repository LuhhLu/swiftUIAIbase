 
import SwiftUI

struct FirstView: View {
    @Binding var showNextView: Bool
    @State  var isExpanded = false
    @State  var startTyping = false
    @State var showtext = false
    var body: some View {
        ZStack{
            GeoView(isExpanded: $isExpanded, startTyping: $startTyping, showtext: $showtext, color: "fview", showNextView: $showNextView)
            VStack(alignment: .leading){
                Text("Swiftui \nFramework").font(.system(size: 50)).bold()
                TypingEffect(fullText: """
                       SwiftUI helps you build great-looking
                       
                       apps across all Apple platforms with
                       
                       the power of Swift — surprisingly
                       
                       little code. You can bring even better...

                       """, isExpanded: $startTyping)
            }
            .opacity(isExpanded ? 1 : 0 )
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x: showtext ? 0 : UIScreen.main.bounds.width) 
            
        }
        .ignoresSafeArea()
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(showNextView: .constant(false))
    }
}
struct GeoView: View {
    // Binding variables - These allow the state to be managed outside this view but also allow this view to update the state.
    @Binding var isExpanded: Bool // Determines if the view is expanded or not
    @Binding var startTyping: Bool // Determines if the typing effect should start
    @Binding var showtext: Bool // Determines if the text should be shown or not
    
    // Regular variables - Used to modify the appearance and behavior of the view.
    var color: String // Color for the circular view
    var text: String = "NEXT" // Text displayed on the button
    var showNextView: Binding<Bool>? // Binding to determine if the next view should be shown. Optional since it's not always required.
    
    // Variable to determine if the view should toggle between expanded and collapsed states on tap. Default is true.
    var shouldToggleExpand: Bool = true
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Circle().foregroundColor(Color(color))
                    .frame(width: isExpanded ? max(geometry.size.width ,geometry.size.height) * 1.5 : 200,
                           height:  isExpanded ? max(geometry.size.width ,geometry.size.height) * 1.5 : 200)
                // Display the "NEXT" text and arrow icon if the view is not expanded
                if !isExpanded{
                    HStack{
                        Text(text)
                        Image(systemName: "arrow.right")
                    }.bold().font(.system(size: 20))
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
            .offset(x: isExpanded ? -250 : 40, y: isExpanded ? -150 : 20) // Offset to adjust position
            
            
        }
        .onTapGesture {
            // Animate the view's state changes
            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)){
                // Toggle the isExpanded state based on the shouldToggleExpand variable
                if shouldToggleExpand{
                    isExpanded .toggle()
                }else{
                    isExpanded = true
                }
                // Toggle other states related to display and animation

                showtext.toggle()
                startTyping = true
                // If there's a binding for showing the next view, toggle its value after a brief delay
                if let showNextViewBinding = showNextView{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        showNextViewBinding.wrappedValue.toggle()
                    }
                }
                
            }
          
        }
    }
}
