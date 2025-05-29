

import SwiftUI
import UIKit
struct ContentView: View {
    @State var ScrollProgress:CGFloat = 0
    var body: some View {
        VStack {
            HStack{
                ProgressView(value: ScrollProgress)
                    .progressViewStyle(CustomProgressViewStyle(progress: ScrollProgress))
                    .frame(height: 30)
                    .frame(maxWidth: .infinity)
                if ScrollProgress >= 1.0{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title3)
                }else{
                    Text("\(Int(ScrollProgress * 100 ))%").bold()
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .background(.black.opacity(0.7))
            .cornerRadius(20)
            ScrollViewRepresentable(progress:$ScrollProgress) {
                AnyView(VStack{
                    Text(anyText)
                        .font(.body)
                        .padding()
                       
                })
            }
        }
        .padding()
         
    }
}
struct ScrollViewRepresentable: UIViewRepresentable{
    @Binding var progress:CGFloat
    let content :() -> AnyView
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> some UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        let  hostView = UIHostingController(rootView: content())
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hostView.view)
        NSLayoutConstraint.activate([
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        return scrollView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    class Coordinator:NSObject,UIScrollViewDelegate{
        var parent:ScrollViewRepresentable
        init(_ parent: ScrollViewRepresentable) {
            self.parent = parent
        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.y
            let totalHeight = scrollView.contentSize.height - scrollView.frame.height
            parent.progress = min(max(0, CGFloat(offset / totalHeight)), 1)
        }
    }
    
    
}
struct CustomProgressViewStyle:ProgressViewStyle{
    var progress:CGFloat
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .tint(progress >= 1.0 ? Color.green : Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let anyText = """
This is a text reading app built with SwiftUI and UIKit. The app displays a large body of text for the user to read, and as the user scrolls through the text, a progress bar at the top of the screen updates to show how much of the text the user has read.

The progress bar is styled to have a black background with a blue fill that increases from left to right. The percentage of the text read is displayed to the right of the progress bar. When the user has read 100% of the text, the percentage text changes to a green checkmark icon.

The app uses a ScrollViewRepresentable to create a UIScrollView that can interact with SwiftUI. The UIScrollViewDelegate method scrollViewDidScroll(_:) is used to calculate the current scroll progress.

The ProgressView is styled with a custom ProgressViewStyle that changes the color of the progress fill from blue to green when the reading is complete. The app also uses conditional rendering to change the percentage text to a checkmark icon when the reading is complete.

This is a simple and clean app for keeping track of reading progress in a long text document. It demonstrates the power of SwiftUI and UIKit working together.
The app uses a ScrollViewRepresentable to create a UIScrollView that can interact with SwiftUI. The UIScrollViewDelegate method scrollViewDidScroll(_:) is used to calculate the current scroll progress.

The ProgressView is styled with a custom ProgressViewStyle that changes the color of the progress fill from blue to green when the reading is complete. The app also uses conditional rendering to change the percentage text to a checkmark icon when the reading is complete.

This is a simple and clean app for keeping track of reading progress in a long text document. It demonstrates the power of SwiftUI and UIKit working together.

"""
