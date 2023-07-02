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
    @State private var scanText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanText: $scanText)
                .frame(height: 400)
            
            Text(scanText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color(uiColor: .black))
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
