import AVFoundation
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CameraViewController
    @Binding var barcodeValue: String

    func makeUIViewController(context: Context) -> CameraViewController {
        return CameraViewController(barcodeValue: $barcodeValue)
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
    }
}

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var barcodeValue: Binding<String>

    init(barcodeValue: Binding<String>) {
        self.barcodeValue = barcodeValue
        super.init(nibName: nil, bundle: nil)
        super.viewDidLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.pdf417]
        } else {
            return
        }


        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
        
        let cancelButton = UIButton(frame: CGRect(x: 20, y: 20, width: 80, height: 40))
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.backgroundColor = UIColor.systemRed
            cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
            view.addSubview(cancelButton)
            
        
    }
    @objc func cancel() {
        DispatchQueue.main.async {
            self.captureSession.stopRunning()
            self.dismiss(animated: true)
        }
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            barcodeValue.wrappedValue = stringValue
            
            DispatchQueue.main.async {
                self.captureSession.stopRunning()
                self.dismiss(animated: true)
            }
        }
    }
}
