//
//  MainVisionView.swift
//  VisionFrameWorkPlayground
//
//  Created by mac on 6/7/23.
//

import SwiftUI

struct MainVisionView: View {
    @State private var isLiveTextRecognitionViewPresented = false
    
    var body: some View {
        VStack {
            Image(systemName: "video")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, vision framework!")
            Text("👓")
            Button(action: {
                isLiveTextRecognitionViewPresented = true
            }) {
                Text("Start!")
            }
            .sheet(isPresented: $isLiveTextRecognitionViewPresented) {
                LiveTextRecognitionView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainVisionView()
    }
}
