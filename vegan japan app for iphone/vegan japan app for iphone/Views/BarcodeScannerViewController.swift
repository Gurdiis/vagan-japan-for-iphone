//
//  BarcodeScannerViewController.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/26.
//

import Foundation
import SwiftUI
import BarcodeScanner

struct BarcodeScannerView: UIViewControllerRepresentable {
    @Binding var isPresentingScanner: Bool
    var codeScanned: (String) -> Void

    func makeUIViewController(context: Context) -> BarcodeScannerViewController {
        let scanner = BarcodeScannerViewController()
        scanner.codeDelegate = context.coordinator
        scanner.errorDelegate = context.coordinator
        scanner.dismissalDelegate = context.coordinator
        return scanner
    }

    func updateUIViewController(_ uiViewController: BarcodeScannerViewController, context: Context) {
        // 这里可以根据需要更新UIViewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
        var parent: BarcodeScannerView

        init(_ barcodeScannerView: BarcodeScannerView) {
            self.parent = barcodeScannerView
        }

        func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
            parent.codeScanned(code)
            parent.isPresentingScanner = false
        }

        func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
            parent.isPresentingScanner = false
        }

        func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
            print(error)
        }
    }
}
