import SwiftUI
import Observation


struct photo:Identifiable{
    var id = UUID()
    var clipId = UUID()
    var imageName:String
}
struct Album: Identifiable {
    var id = UUID()
    var images: [photo]
}
@Observable
class DataModel{
    static var share = DataModel()
    var selectedImages: [photo]?
    var isSheetPresented = false
    var albums: [Album] = [
        Album(images: [
            photo(imageName: "im27"),
            photo(imageName: "im28"),
            photo(imageName: "im29"),
            photo(imageName: "im30")
        ]),
        Album(images: [
            photo(imageName: "im12"),
            photo(imageName: "im15"),
            photo(imageName: "im44"),
            photo(imageName: "im32"),
            photo(imageName: "im17"),
            photo(imageName: "im14"),
        ]),
        Album(images: [
            photo(imageName: "im4"),
            photo(imageName: "im5"),
            photo(imageName: "im6"),
            photo(imageName: "im7"),
            photo(imageName: "im8"),
            photo(imageName: "im9"),
             
        ]),
        Album(images: [
            photo(imageName: "im40"),
            photo(imageName: "im41"),
            photo(imageName: "im42"),
            photo(imageName: "im43"),
            photo(imageName: "im45")
        ]),
        Album(images: [
            photo(imageName: "im31"),
            photo(imageName: "im32"),
            photo(imageName: "im33"),
            photo(imageName: "im34")
        ]),
        Album(images: [
            photo(imageName: "im34"),
            photo(imageName: "im35"),
            photo(imageName: "im36"),
            photo(imageName: "im37")
        ]),
        Album(images: [
            photo(imageName: "im4"),
            photo(imageName: "im32"),
            photo(imageName: "im30"),
            photo(imageName: "im29")
        ]),
        Album(images: [
            photo(imageName: "im10"),
            photo(imageName: "im20"),
            photo(imageName: "im30"),
            photo(imageName: "im40")
        ])
    ]
    
}
#Preview {
    HomeView()
}
