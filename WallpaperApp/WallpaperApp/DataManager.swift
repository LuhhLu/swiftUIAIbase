import SwiftUI
import Firebase
import Foundation
import SDWebImageSwiftUI
import Photos
class DataManager: ObservableObject{
    @Published var imageUrls = [String]()
    @Published var imageUrlsT = [String]()
    @Published var circleProgress: CGFloat = 0.0
    @Published var animateCircle: Bool = false
    @Published var selectedImage: String? = nil
    func loadImages(name: String, appenAction: @escaping (String) -> Void){
        let db = Firestore.firestore()
        db.collection(name).getDocuments { (snapshot, error)in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in snapshot!.documents{
                    if let url = document.data()["url"] as? String{
                        appenAction(url)
                    }
                }
            }
        }
    }
    func downloadansSaveImage(url:String){
        guard let imageURL = URL(string: url) else{return}
        URLSession.shared.dataTask(with: imageURL){(data,response,error) in
            guard let data = data,error == nil else{return}
            PHPhotoLibrary.shared().performChanges({
                let creationRequest = PHAssetCreationRequest.forAsset()
                let options = PHAssetResourceCreationOptions()
                options.shouldMoveFile = true
                creationRequest.addResource(with: .photo, data: data, options: options)
            }) { (success, error) in
                if success{
                    print("Image saved to Photos")
                }else if let error = error{
                    print("Error saving image to Photos: \(error)")
                }
            }
            
        }.resume()
    }
    
   
}
