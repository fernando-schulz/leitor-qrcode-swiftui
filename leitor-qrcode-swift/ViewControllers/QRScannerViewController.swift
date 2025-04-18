//
//  QRScannerViewController.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import SwiftUI

struct QRScannerViewController: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var scannedCode: String?
    @State private var qrFrame: CGRect = .zero
    
    var body: some View {
        ZStack {
            CameraPreviewServices(scannedCode: $scannedCode, qrFrame: $qrFrame)
                .edgesIgnoringSafeArea(.all)
            
            if let frame = qrFrame.isEmpty ? nil : qrFrame {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: frame.width, height: frame.height)
                    .position(x: frame.midX, y: frame.midY)
                    .animation(.easeInOut, value: frame)
            }
            
            VStack {
                HStack {
                    Button(action: { dismiss() }) {
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
            if let string = code, let url = URL(string: string), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

#Preview {
    QRScannerViewController()
}
