 

import SwiftUI

enum Sections: CaseIterable, Hashable, Identifiable {
    case general, services, facilities, reviews, buy, about
    
    var id: String { return title }
    
    var title: String {
        switch self {
        case .general:
            "General"
        case .services:
            "Services"
        case .facilities:
            "Facilities"
        case .reviews:
            "Reviews"
        case .buy:
            "Buy"
        case .about:
            "About"
        }
    }
}




struct DetailsView: View {
    @Namespace private var animationNamespace
    @State private var scrollTo: Sections? = nil
    @State private var scrollOffset: CGFloat = 0.0
    @State private var selectedSection: Sections = .general
    
    enum Constant {
        static let imageHeight: CGFloat = 300.0
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ImageGalleryView(
                scrollOffset: scrollOffset,
                imageHeight: Constant.imageHeight
            )
            
            ContentView(
                scrollViewTopPadding: scrollViewTopPadding(),
                scrollContentTopPadding: scrollContentTopPadding(),
                scrollOffset: $scrollOffset,
                selectedSection: $selectedSection,
                scrollTo: $scrollTo
            )

            NavigationBarView(
                tabBarOpacity: tabBarOpacity(),
                scrollOffset: scrollOffset,
                imageHeight: Constant.imageHeight,
                animationNamespace: animationNamespace,
                scrollTo: $scrollTo,
                selectedSection: $selectedSection
            )
        }
        .ignoresSafeArea()
    }
}

extension DetailsView {
    func tabBarOpacity() -> CGFloat {
        guard scrollOffset > 90 else { return 0.0 }
        
        return 1 - 30/(scrollOffset - 90)
    }
    
    func scrollContentTopPadding() -> CGFloat {
        guard scrollOffset > 0 else { return 0 }
        guard scrollOffset < 150 else { return 150 }
        return min(150, scrollOffset)
    }
    
    func scrollViewTopPadding() -> CGFloat {
        if scrollOffset < 0 { return Constant.imageHeight }
        if scrollOffset > 150 { return 150 }
        
        return Constant.imageHeight - scrollOffset
    }
}

#Preview {
    DetailsView()
}
