
import SwiftUI
import PhotosUI
import Vision
import CoreImage.CIFilterBuiltins

@Observable
class RemovalBackgroundManager {
    var isLoading: Bool = false
    var processedImage: UIImage?
    var selectedItem: PhotosPickerItem? {
        didSet {
            if selectedItem != oldValue {
               
                processedImage = nil
                loadSelectedImage()
            }
        }
    }
    
    private var processingImageQueue = DispatchQueue(label: "ProcessingImageQueue")
    private var imageLoadingTask: Task<Void, Never>?

    var selectedPickerItemBinding: Binding<PhotosPickerItem?> {
        Binding {
            return self.selectedItem
        } set: { newValue in
            self.selectedItem = newValue
        }
    }
    func loadSelectedImage() {
        imageLoadingTask?.cancel()
        guard let selectedItem = selectedItem else { return }
        imageLoadingTask = Task {
            isLoading = true
            defer { isLoading = false }
            if let data = try? await selectedItem.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.processedImage = uiImage
                }
            } else {
                DispatchQueue.main.async {
                    self.processedImage = nil
                }
            }
        }
    }
    func createSticker() {
        guard let image = processedImage else { return }
        guard let inputImage = CIImage(image: image) else { return }
        processingImageQueue.async {
            guard let maskImage = self.createMaskImage(from: inputImage) else { return }
            let outputImage = self.apply(mask: maskImage, to: inputImage)
            let image = self.render(ciImage: outputImage)
            DispatchQueue.main.async {
                self.processedImage = image
            }
        }
    }

    private func render(ciImage: CIImage) -> UIImage {
        guard let cgImage = CIContext(options: nil).createCGImage(ciImage, from: ciImage.extent) else {
            fatalError("Failed to render CGImage")
        }
        return UIImage(cgImage: cgImage)
    }
    private func apply(mask: CIImage, to image: CIImage) -> CIImage {
        let filter = CIFilter.blendWithMask()
        filter.inputImage = image
        filter.maskImage = mask
        filter.backgroundImage = CIImage.empty()
        return filter.outputImage!
    }
    private func createMaskImage(from inputImage: CIImage) -> CIImage? {
        let handler = VNImageRequestHandler(ciImage: inputImage)
        let request = VNGenerateForegroundInstanceMaskRequest()
        do {
            try handler.perform([request])
        } catch {
            return nil
        }
        guard let result = request.results?.first else {
            return nil
        }
        do {
            let maskPixel = try result.generateScaledMaskForImage(forInstances: result.allInstances, from: handler)
            return CIImage(cvPixelBuffer: maskPixel)
        } catch {
            return nil
        }
    }
}
