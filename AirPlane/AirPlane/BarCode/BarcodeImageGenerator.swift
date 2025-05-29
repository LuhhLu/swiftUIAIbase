

import SwiftUI
class BarcodeImageGenerator {
   let context = CIContext()
   var filter: CIFilter = CIFilter(name: "CIPDF417BarcodeGenerator")!
   
   func generateBarcode(from barcodeValue: String) -> UIImage? {
       let data = Data(barcodeValue.utf8)
       filter.setValue(data, forKey: "inputMessage")
       
       if let outputImage = filter.outputImage {
           if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
               return UIImage(cgImage: cgimg)
           }
       }

       return nil
   }
}


