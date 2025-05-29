import SwiftUI

struct DestinationDetailView: View {
    let options: [DropdownOption] = [

        DropdownOption(title: "Details" , icon: "info.circle" , action: { print("Show product details") }) ,

        DropdownOption(title: "Edit" , icon: "pencil" , action: { print("Edit item") }) ,

        DropdownOption(title: "Share" , icon: "square.and.arrow.up" , action: { print("Share item") }) ,

        DropdownOption(title: "Delete" , icon: "trash" , action: { print("Delete item") })

    ]
    var body: some View {
        VStack(spacing: 0) {
       
            ZStack(alignment: .top) {
                Image("im")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 12) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 40, height: 5)
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 8)

                HStack {
                    Text("Santorini")
                        .font(.title2)
                        .bold()

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                        Text("4.8")
                            .bold()
                    }
                    .padding(6)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(Capsule())
                }

                HStack(spacing: 8) {
                    Label("Greece", systemImage: "flag")
                        .foregroundColor(.primary)

                    Spacer()

                    Text("98 reviews")
                        .underline()
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }

                Text("Santorini, a stunning Greek island in the Aegean Sea, is famed for its white-washed houses, blue domes, and unforgettable sunsets over the caldera.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)

                Text("Explore more")
                    .font(.callout)
                    .underline()
                    .foregroundColor(.blue)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 10)
            )
            .offset(y: -60)
            Spacer()
        }
        .overlay(alignment: .topTrailing, content: {
            DropdownMenu(dropdownAlignment: .trailing, options: options)
                .padding(.horizontal, 20)
                .padding(.top, 60)
        })
        .ignoresSafeArea()
    }
}
struct CircleButton: View {
    var icon: String
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(width: 40, height: 40)
                .background(Color(.systemBackground))
                .clipShape(Circle())
        }
    }
}

#Preview {
    DestinationDetailView()
}

 
