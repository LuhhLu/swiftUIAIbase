 
import Foundation
class PostGrip:ObservableObject {
    var slected : PostModel?{
        didSet{
            didsetPost = true
        }
    }
    @Published var didsetPost = false
}

 
