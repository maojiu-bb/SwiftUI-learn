//
//  ContentView.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(
            selection: $selection,
            content:  {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)
                
                LandMarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
        )
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
