//
//  QRScannerViewController.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import SwiftUI

struct QRScannerViewController: View {
    
    @State private var scannedCode: String?
    //@State private var qrFrame: CGRect = .zero
    @Binding var isPresented: Bool
    @Binding var result: String?
    
    var body: some View {
        ZStack {
            //CameraPreviewServices(scannedCode: $scannedCode, qrFrame: $qrFrame)
            CameraPreviewServices(scannedCode: $scannedCode)
                .edgesIgnoringSafeArea(.all)
            
            /*if let frame = qrFrame.isEmpty ? nil : qrFrame {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: frame.width, height: frame.height)
                    .position(x: frame.midX, y: frame.midY)
                    .animation(.easeInOut, value: frame)
            }*/
            
            VStack {
                HStack {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .onChange(of: scannedCode) { code in
            if let string = code {
                if let url = URL(string: string), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
                result = string
                isPresented = false
            }
        }
    }
}

#Preview {
    QRScannerViewControllerPreview()
}

struct QRScannerViewControllerPreview: View {
    @State private var isPresented: Bool = true
    @State private var result: String? = nil
    
    var body: some View {
        QRScannerViewController(isPresented: $isPresented, result: $result)
    }
}
