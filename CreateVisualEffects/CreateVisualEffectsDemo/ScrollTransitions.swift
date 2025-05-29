/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Examples for using scroll transitions for a view.
*/

import SwiftUI

#Preview("Paging + Parallax") {
    let photos = [
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA")
    ]

    ScrollView(.horizontal) {
        LazyHStack(spacing: 12) {
            ForEach(photos) { photo in
                VStack {
                    DestinationPhoto(photo)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 36))

                    DestinationLabel(photo)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .offset(x: phase.value * 100)
                        }
                }
            }
        }
    }
    .contentMargins(24)
    .scrollTargetBehavior(.paging)
}

#Preview("Paging + Rotation") {
    let photos = [
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA")
    ]

    ScrollView(.horizontal) {
        LazyHStack(spacing: 12) {
            ForEach(photos) { photo in
                DestinationPhoto(photo)
                    .containerRelativeFrame(.horizontal)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
                    .scrollTransition(axis: .horizontal) { content, phase in
                        content
                            .rotationEffect(.degrees(phase.value * 1.5))
                    }
            }
        }
    }
    .contentMargins(24)
    .scrollTargetBehavior(.paging)
}

#Preview("Paging") {
    let photos = [
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA"),
        Photo("San Francisco, CA")
    ]

    ScrollView(.horizontal) {
        LazyHStack(spacing: 12) {
            ForEach(photos) { photo in
                DestinationPhoto(photo)
                    .containerRelativeFrame(.horizontal)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
            }
        }
    }
    .contentMargins(24)
    .scrollTargetBehavior(.paging)
}

struct Photo: Identifiable {
    var title: String

    var id: Int = .random(in: 0 ... 100)

    init(_ title: String) {
        self.title = title
    }
}

struct DestinationPhoto: View {
    var photo: Photo

    init(_ photo: Photo) {
        self.photo = photo
    }

    var body: some View {
        Image("palm_tree")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct DestinationLabel: View {
    var photo: Photo

    init(_ photo: Photo) {
        self.photo = photo
    }

    var body: some View {
        Text(photo.title)
            .font(.system(.headline, design: .rounded, weight: .semibold))
    }
}
