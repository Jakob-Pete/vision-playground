//
//  LiveTextRecognitionView.swift
//  VisionFrameWorkPlayground
//
//  Created by mac on 6/21/23.
//

import SwiftUI
import Vision
import AVFoundation
import VisionKit

struct LiveTextRecognitionView: View {
    
    @State private var startScanning = false
    @State private var scanResult = [""]
    
    var body: some View {
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanResult: $scanResult)
            List(scanResult, id: \.self) {
                result in
                Text(result)
            }
            .frame(maxHeight: 300)
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

struct LiveTextRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextRecognitionView()
    }
}
