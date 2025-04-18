//
//  QRCodeScannerProtocol.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import Foundation

protocol QRCodeScannerProtocol: AnyObject {
    func didFind(code: String)
    func didUpdateQRFrame(frame: CGRect)
}
