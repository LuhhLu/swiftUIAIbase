import SwiftUI
import CoreImage.CIFilterBuiltins

struct BarcodeGeneratorView: View {
    let context = CIContext()
    var filter: CIFilter = CIFilter(name: "CIPDF417BarcodeGenerator")!
    var barcodeValue: String
    var barcodeImage: UIImage?
    var body: some View {
        VStack {
            if let image = generateBarcode(from: barcodeValue) {
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                       
                        .frame(width: 340, height: 100)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 80)
                        .clipped()
                }
            }
            if let imageshare = barcodeImage {
                Image(uiImage: imageshare)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
            }
        }
    }

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
