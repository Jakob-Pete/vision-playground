//
//  MainVisionView.swift
//  VisionFrameWorkPlayground
//
//  Created by mac on 6/7/23.
//

import SwiftUI

struct MainVisionView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainVisionView()
    }
}
