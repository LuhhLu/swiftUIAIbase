 

import SwiftUI

struct DropdownGroup: Identifiable {
    let id = UUID()
    var options: [DropdownOption]
}

struct GroupDropdown: View {
    @State private var isExpanded = false

    private var groups: [DropdownGroup] = [
        DropdownGroup(options: [
            DropdownOption(title: "Copy", icon: "doc.on.doc", action: { print("Copy") }),
            DropdownOption(title: "Edit", icon: "gear", action: { print("Edit") })
        ]),
        DropdownGroup(options: [
            DropdownOption(title: "Group", icon: "square.stack.3d.down.right", action: { print("Group") }),
            DropdownOption(title: "Clone", icon: "doc.on.doc.fill", action: { print("Clone") })
        ]),
        DropdownGroup(options: [
            DropdownOption(title: "Delete", color: .red, icon: "trash", action: { print("Delete") })
        ])
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Grouped item")
                    .bold()
                    .fixedSize()
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .padding(.leading, 6)
            }
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.5)) {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(groups.indices, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(groups[index].options) { option in
                                HStack(spacing: 8) {
                                    if let icon = option.icon {
                                        Image(systemName: icon)
                                    }
                                    Text(option.title)
                    
                                }
                                .foregroundColor(option.color)
                                .padding(.vertical, 6)
                                .onTapGesture {
                                    option.action()
                                    withAnimation(.bouncy(duration: 0.5)) {
                                        isExpanded = false
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 8)

                        if index < groups.count - 1 {
                      Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.gray.opacity(0.3))
                                .padding(.vertical, 4)
                                .frame(width: 140)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxHeight: isExpanded ? .none : 50,alignment: .top)
        .clipped()
        .background(RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(.BG)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        )
        .frame(height: 50,alignment: .top)
  
    }
}


#Preview {
    GroupDropdown()
}
