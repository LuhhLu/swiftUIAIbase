 
import SwiftUI

struct ScrollTabView: View {
    @Binding var scrollTo: Sections?
    @Binding var selectedSection: Sections
    let animationNamespace: Namespace.ID
    let tabBarOpacity: CGFloat
    let scrollOffset: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                HStack(spacing: 20) {
                    ForEach(Sections.allCases) { section in
                        if selectedSection == section {
                            Text(section.title)
                                .id(section)
                                .padding(.vertical,12)
                                .overlay(alignment: .bottom) {
                                    Rectangle()
                                        .frame(height: 4)
                                        .frame(maxWidth: .infinity)
                                        .matchedGeometryEffect(id: "underline", in: animationNamespace)
                                        .transition(.offset(y: -1))
                                }
                        }else{
                            Text(section.title)
                                .id(section)
                                .onTapGesture {
                                    scrollTo = section
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .onChange(of: selectedSection) { _, newSection in
                    withAnimation {
                        proxy.scrollTo(newSection, anchor: .center)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .font(.subheadline)
        .fontWeight(.medium)
        .opacity(tabBarOpacity)
        .background(scrollOffset > imageHeight ? .adaptiveWhite : .clear)
        .background {
            if scrollOffset > imageHeight/2 {
                Color.adaptiveWhite.shadow(color: .gray.opacity(0.15), radius: 2, x: 0, y: 2)
            } else {
                Color.clear
            }
        }
    }
}
