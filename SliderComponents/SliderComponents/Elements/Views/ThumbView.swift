//
//  ThumbView.swift
//  SliderComponent
//
//  Created by Piotrek Jeremicz on 30.11.2024.
//

import SwiftUI

protocol ThumbView: View { }

struct StrokeThumb: ThumbView {
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        Circle()
            .fill(.indigo)
//        Circle()
//            .stroke(
//                .black.mix(
//                    with: .primary,
//                    by: isEnabled ? 0 : 0.7
//                ),
//                lineWidth: 2
//            )
    }
}

struct TinyThumb: ThumbView {
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2, style: .circular)
            .fill(.white)
            .frame(width: 8)
        
        RoundedRectangle(cornerRadius: 2, style: .circular)
            .fill(
                .black.mix(
                    with: .white,
                    by: isEnabled ? 0 : 0.7
                )
            )
            .frame(width: 5)
    }
}

struct SolidThumb: ThumbView {
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        Circle()
            .fill(
                .black.mix(
                    with: .white,
                    by: isEnabled ? 0 : 0.7
                )
            )
    }
}

struct SquareThumb: ThumbView {
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        RoundedRectangle(cornerRadius:42, style: .circular)
            .fill(.white)
        RoundedRectangle(cornerRadius: 4, style: .circular)
            .stroke(
                .black.mix(
                    with: .white,
                    by: isEnabled ? 0 : 0.7
                ),
                lineWidth: 2
            )
    }
}
