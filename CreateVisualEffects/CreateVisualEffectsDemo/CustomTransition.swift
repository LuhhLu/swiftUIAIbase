/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Examples for using custom transitions and composing built-in transition
 modifiers.
*/

import SwiftUI

#Preview("Custom Transition") {
    @Previewable @State var isVisible: Bool = true

    VStack {
        GroupBox {
            Toggle("Visible", isOn: $isVisible.animation())
        }

        Spacer()

        if isVisible {
            Avatar()
                .transition(Twirl())
        }

        Spacer()
    }
    .padding()
}

#Preview("Composing existing transitions") {
    @Previewable @State var isVisible: Bool = true

    VStack {
        GroupBox {
            Toggle("Visible", isOn: $isVisible.animation())
        }

        Spacer()

        if isVisible {
            Avatar()
                .transition(.scale.combined(with: .opacity))
        }

        Spacer()
    }
    .padding()
}

struct Twirl: Transition {
    var clockwise: Bool = true

    func body(content: Content, phase: TransitionPhase) -> some View {
        let rotated = Angle(degrees: clockwise ? -360 : 360)

        content.visualEffect { view, _ in
            view
                .opacity(phase.isIdentity ? 1 : 0)
                .scaleEffect(phase.isIdentity ? 1 : 0.5)
                .blur(radius: phase.isIdentity ? 0 : 10)
                .rotationEffect(phase.isIdentity ? .zero : rotated)
        }
    }
}

struct Avatar: View {
    var body: some View {
        Circle()
            .fill(.blue.shadow(.drop(radius: 2, y: 2)))
            .overlay {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.5)
                    .foregroundStyle(.white)
            }

    }
}
