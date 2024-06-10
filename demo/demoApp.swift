//
//  demoApp.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import SwiftUI
import SwiftData

@main
struct demoApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
