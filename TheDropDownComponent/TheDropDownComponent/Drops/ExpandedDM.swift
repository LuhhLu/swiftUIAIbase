import SwiftUI

struct ExpandedDM: View {
    @State var isExpanded = false
    @State private var menuWidth: CGFloat = 0
    @State private var menuhHeight: CGFloat = 0
    var showIcon: Bool = false
    var options: [DropdownOption] {
        [
            DropdownOption(title: "Option 1", icon: "star", action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }),
            DropdownOption(title: "Option 2", icon: "heart", action:{  withAnimation {
                isExpanded.toggle()
            } }),
            DropdownOption(title: "Option 3",icon: "heart", action: {  withAnimation {
                isExpanded.toggle()
            } }),
            DropdownOption(title: "Option 4", icon: "bell", action: {  withAnimation {
                isExpanded.toggle()
            } }),
        ]
    }
    var body: some View {
        VStack (alignment: .leading, spacing: 18){
            HStack{
                Text("Expanded rop down").bold()
                    .fixedSize()
                Image(systemName: "chevron.forward")
                    .rotationEffect(.degrees(isExpanded ?  90 : 0))
                    .padding(.leading,10)
            }
            .onTapGesture {
                withAnimation (.bouncy(duration: 0.5)){
                    isExpanded.toggle()
                }
            }
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(options) { option in
                        HStack(spacing: 8) {
                            if showIcon, let iconName = option.icon {
                                Image(systemName: iconName)
                            }
                            
                            Text(option.title)
 
                        }
                        .foregroundColor(option.color)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            option.action()
                                isExpanded = false
                        }
                    }
                  
                }
        }
        .padding()
        .frame(maxHeight: isExpanded ? .none : 50,alignment: .top)
        .animation(.bouncy(duration: 0.5), value: isExpanded)
        .clipped()
        .background(RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(.BG)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        )
        .frame(height: 50,alignment: .top)
    }
}

#Preview {
    ExpandedDM()
}
