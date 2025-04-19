//
//  CameraPreviewServices.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import SwiftUI

struct CameraPreviewServices: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String?
    //@Binding var qrFrame: CGRect
    
    func makeUIViewController(context: Context) -> QRCodeScannerServices {
        let vc = QRCodeScannerServices()
        vc.delegate = context.coordinator
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: QRCodeScannerServices, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, QRCodeScannerProtocol {
        var parent: CameraPreviewServices
        
        init(_ parent: CameraPreviewServices) {
            self.parent = parent
        }
        
        func didFind(code: String) {
            parent.scannedCode = code
        }
        
        /*func didUpdateQRFrame(frame: CGRect) {
            DispatchQueue.main.async {
                self.parent.qrFrame = frame
            }
        }*/
    }
}
