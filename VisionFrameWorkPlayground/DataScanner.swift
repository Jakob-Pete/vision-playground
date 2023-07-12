//
//  DataScanner.swift
//  VisionFrameWorkPlayground
//
//  Created by mac on 6/26/23.
//


import SwiftUI
import UIKit
import VisionKit

struct DataScanner: UIViewControllerRepresentable {
    
    @Binding var startScanning: Bool
    @Binding var scanResult: [String]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> DataScannerViewController{
        let controller = DataScannerViewController(
            recognizedDataTypes: [.text()],
            qualityLevel: .balanced,
            recognizesMultipleItems: true,
            isHighFrameRateTrackingEnabled: true,
//            isGuidanceEnabled: true,
            isHighlightingEnabled: true)
        //        controller.recognizedItems
                
                var overlayContainerView: UIView
        //        A view that the data scanner displays over its view without interfering with the Live Text interface.
        
                var regionOfInterest: CGRect?
//                The area of the live video in view coordinates that the data scanner searches for items.
        
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
   
    @MainActor
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScanner
        
        init(_ parent: DataScanner) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            handleItems(allItems)
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didUpdate updatedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            handleItems(allItems)
        }
        
        func handleItems(_ items: [RecognizedItem]) {
            print("Items count : \(items.count)")
            parent.scanResult = items.compactMap { $0.text }
            items.forEach { item in
                switch item {
                case .text(let text):
                    print("Scanned words: \(text.transcript)")
                default: break
                }
            }
        }
    }
}

extension RecognizedItem {
    var text: String? {
        switch self {
        case .text(let text):
            return text.transcript
        default:
            return nil
        }
    }
}
