import SwiftUI

struct MusicType: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let image: ImageResource
}

struct MultiSelection: View {
    @State private var musicTypes: [MusicType] = [
        MusicType(name: "Rock", image: .im),
        MusicType(name: "Jazz", image: .im2),
        MusicType(name: "Classical", image: .im3),
        MusicType(name: "Pop", image: .im4),
        MusicType(name: "Hip Hop", image: .im5),
        MusicType(name: "Electronic", image: .im6),
    ]
    
    @State var selectedTypes: [MusicType] = []
    
    let maxSelection = 3

    
    var body: some View {
        VStack(alignment:.leading) {
            Text("Select Your Favorite 3 Music Types")
                .font(.title.bold()).padding()
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                ForEach(musicTypes) { musicType in
                    Button(action: {
                        withAnimation {
                            toggleSelection(for: musicType)
                        }
                     
                    }) {
                        VStack {
                            Image(musicType.image).resizable().scaledToFill()
                                .frame(width: 80, height: 80).clipShape(Circle())
                                .padding(3)
                                .background(selectedTypes.contains(musicType) ? .white : .gray.opacity(0.3),in:.circle)
                              
                            Text(musicType.name).bold()
                                .font(.subheadline)
                        }
                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .disabled(!selectedTypes.contains(musicType) && selectedTypes.count >= maxSelection)
                }
            }
 
            .padding()
            Spacer()
        }
 
    }
    
    private func toggleSelection(for musicType: MusicType) {
        if selectedTypes.contains(musicType) {
            selectedTypes.removeAll { $0.id == musicType.id }
        } else if selectedTypes.count < maxSelection {
            selectedTypes.append(musicType)
        }
    }
}

#Preview {
   MultiSelection()
}
