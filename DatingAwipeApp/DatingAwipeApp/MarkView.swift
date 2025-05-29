 

import SwiftUI

struct MarkView: View {
    let kind: Kind
    
    @Binding var offset: CGSize
    @Binding var cardOffset: CGSize
    
    private let screenMidX = UIScreen.main.bounds.midX
    
    var body: some View {
        Circle()
            .fill(kind.backgroundColor)
            .frame(width: 116, height: 116)
            .overlay {
                kind.image
                    .resizable().scaledToFill()
                    .frame(width: 48, height: 48)
                    .fontDesign(.rounded)
                    .bold()
            }
            .opacity(opacity)
            .scaleEffect(scale)
            .offset(x: xOffset)
            .allowsTightening(false)
    }
    
    var opacity: Double {
        kind.direction * offset.width/screenMidX
    }
    
    var scale: CGFloat {
        switch kind {
        case .check:
            guard offset.width > 0 else { return 0.4 }
        case .x:
            guard offset.width < 0 else { return 0.4 }
        }
        
        let scale = (kind.direction * offset.width/screenMidX) + 0.4
        
        if scale > 1 {
            return 1
        } else {
            return scale
        }
    }
    
    var xOffset: CGFloat {
        switch kind {
        case .check:
            guard offset.width >= 0 else { return screenMidX + 116/2 }
        case .x:
            guard offset.width < 0 else { return -screenMidX - 116/2 }
        }
        
        let markOffset = screenMidX * (-offset.width/screenMidX) + kind.direction * (screenMidX + 116/2)
        
        switch kind {
        case .check:
            if markOffset < 60 {
                return 60
            } else {
                return markOffset
            }
        case .x:
            if markOffset > -60 {
                return -60
            } else {
                return markOffset
            }
        }
    }
}

extension MarkView {
    enum Kind {
        case check, x
        
        var backgroundColor: Color {
            switch self {
            case .check:
                Color.accent.opacity(0.8)
            case .x:
                Color.white.opacity(0.8)
            }
        }
        
        var image: Image {
            switch self {
            case .check:
                Image(systemName: "checkmark")
            case .x:
                Image(systemName: "xmark")
            }
        }
        
        var direction: CGFloat {
            switch self {
            case .check: 1
            case .x: -1
            }
        }
    }
}

#Preview {
    MarkView(
        kind: .check,
        offset: .constant(.zero),
        cardOffset: .constant(.zero)
    )
}
