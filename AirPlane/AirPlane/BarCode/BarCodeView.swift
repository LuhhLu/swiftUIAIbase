
import SwiftUI

struct BarCodeView: View {
   @State var barcodeValue: String = ""
   @State var showCamera = false
   @State var showShareSheet = false
   var barcodeGenerator = BarcodeImageGenerator()
   var body: some View {
       ZStack{
           HStack{
               let barcodeImage = barcodeGenerator.generateBarcode(from: barcodeValue)
               if barcodeImage != nil {
                   Button {
                       showShareSheet = true
                   } label: {
                       Image(systemName: "square.and.arrow.up")
                           .foregroundColor(.gray)
                           .font(.largeTitle)
                   }
                   
                   .sheet(isPresented: $showShareSheet) {
                       ActivityViewController(activityItems: [barcodeImage!])
                   }
               }else{
                   Image(systemName: "square.and.arrow.up")
                       .foregroundColor(.black)
                       .font(.largeTitle)
               }
               Spacer()
               Button {
                   showCamera = true
               } label: {
                   Image(systemName: "camera.viewfinder")
                       .foregroundColor(.gray)
                       .font(.largeTitle)
               }
               .sheet(isPresented: $showCamera) {
                   CameraView(barcodeValue: $barcodeValue)
               }
           }
           .frame(maxHeight: .infinity,alignment: .top)
           .padding()
           BarcodeGeneratorView(barcodeValue: barcodeValue)
       }
   }
}
   

 
