 

import SwiftUI

struct NavigationBarView: View {
    let tabBarOpacity: CGFloat
    let scrollOffset: CGFloat
    let imageHeight: CGFloat
    let animationNamespace: Namespace.ID
    
    @Binding var scrollTo: Sections?
    @Binding var selectedSection: Sections
    
    var body: some View {
        VStack() {
            HStack(spacing: 16){
                ButtonView(action: {
                    //
                }, imageName: "arrow.left", tabBarOpacity: tabBarOpacity)
                
                Text("Superior Room")
                    .font(.title3)
                    .fontWeight(.medium)
                    .opacity(max(scrollOffset/(imageHeight/2), 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                ButtonView(
                    action: {},
                    imageName: "square.and.arrow.up",
                    tabBarOpacity: tabBarOpacity
                )
                
                ButtonView(
                    action: {},
                    imageName: "heart",
                    tabBarOpacity: tabBarOpacity
                )
                
            }
            .padding(.top, 64)
            .padding(.horizontal)
            
            ScrollTabView(
                scrollTo: $scrollTo,
                selectedSection: $selectedSection,
                animationNamespace: animationNamespace,
                tabBarOpacity: tabBarOpacity,
                scrollOffset: scrollOffset,
                imageHeight: imageHeight
            )
        }
        .background(scrollOffset > imageHeight/2 ? .adaptiveWhite : .clear)
        .frame(maxWidth: .infinity)
    }
}
 
