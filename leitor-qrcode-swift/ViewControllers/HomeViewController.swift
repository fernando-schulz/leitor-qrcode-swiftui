//
//  HomeViewController.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import SwiftUI

struct HomeViewController: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.showScanner {
                QRScannerViewController(isPresented: $viewModel.showScanner, result: $viewModel.qrCodeText)
            } else {
                VStack {
                    Button(action: {
                        self.viewModel.showScanner = true
                    }) {
                        VStack {
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .padding()
                            
                            Text("Escanear QR Code")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    
                    if viewModel.qrCodeText != nil {
                        Text("Texto do QR Code: \(viewModel.qrCodeText ?? "")")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                }
            }
        }
        .animation(.easeInOut, value: viewModel.showScanner)
    }
}

#Preview {
    HomeViewController(viewModel: HomeViewModel())
}
