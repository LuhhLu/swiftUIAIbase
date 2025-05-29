
import SwiftUI

struct SegmentedOption: Identifiable {
    let id = UUID()
    var title: String
    var action: () -> Void
}

struct SegmentedDropdownMenu: View {
    @State private var isExpanded = false
    @State private var menuWidth: CGFloat = 0
    @State private var selectedOption: SegmentedOption

    var dropdownAlignment: DropdownAlignment
    let options: [SegmentedOption]

    init(
        dropdownAlignment: DropdownAlignment = .center,
        options: [SegmentedOption]
    ) {
        self.dropdownAlignment = dropdownAlignment
        self.options = options
        _selectedOption = State(initialValue: options[0])
    }

    private var frameAlignment: Alignment {
        switch dropdownAlignment {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }

    private var transitionAnchor: UnitPoint {
        switch dropdownAlignment {
        case .leading: return .topLeading
        case .center: return .top
        case .trailing: return .topTrailing
        }
    }

    var body: some View {
        ZStack {
            Button(action: {
                isExpanded.toggle()
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.up.arrow.down")
                    Text(selectedOption.title)
                        .fontWeight(.medium)
                        .fixedSize()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .foregroundStyle(.BG)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                )
            }
            .tint(.primary)
            .frame(height: 50)
            .frame(width: menuWidth, alignment: frameAlignment)
            .overlay(alignment: .top) {
                if isExpanded {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(options) { option in
                            HStack {
                                Circle()
                                    .fill(option.id == selectedOption.id ? .blue : .gray)
                                    .frame(width: 10, height: 10)

                                Text(option.title)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .onTapGesture {
                                selectedOption = option
                                option.action()
                                withAnimation {
                                    isExpanded = false
                                }
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.BG)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    )
                    .offset(y: 50)
                    .fixedSize()
                    .transition(
                        .scale(scale: 0, anchor: transitionAnchor)
                        .combined(with: .opacity)
                        .combined(with: .offset(y: 40))
                    )
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                    menuWidth = proxy.size.width
                                }
                        }
                    )
                }
            }
        }
        .frame(width: menuWidth)
        .frame(maxWidth: .infinity, alignment: frameAlignment)
        .animation(.smooth, value: isExpanded)
    }
}
#Preview {
    SegmentedDropdownMenu(
        dropdownAlignment: .trailing,
        options: [
            SegmentedOption(title: "Recents", action: { print("Recents") }),
            SegmentedOption(title: "Recently added", action: { print("Recently added") }),
            SegmentedOption(title: "Alphabetical", action: { print("Alphabetical") })
        ]
    )
}
