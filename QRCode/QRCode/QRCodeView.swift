 
import SwiftUI
import CoreImage.CIFilterBuiltins
struct QRCodeView: View {
    var text:String
    var body: some View {
        VStack {
            Text("QR Code").bold()
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top)
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(width: 250, height: 250)
                .overlay {
                    Image(uiImage: generateQRCode(from: text))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                }
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
        }
    }
    func generateQRCode(from string:String)-> UIImage{
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data  = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage{
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(text: "")
    }
}
