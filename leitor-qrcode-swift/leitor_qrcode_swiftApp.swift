//
//  leitor_qrcode_swiftApp.swift
//  leitor-qrcode-swift
//
//  Created by Fernando Schulz on 18/04/25.
//

import SwiftUI

@main
struct leitor_qrcode_swiftApp: App {
    var body: some Scene {
        WindowGroup {
            HomeViewController(viewModel: HomeViewModel())
        }
    }
}
