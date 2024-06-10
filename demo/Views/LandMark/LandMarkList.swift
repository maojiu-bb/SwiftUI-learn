//
//  LandMarkList.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import SwiftUI

struct LandMarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavorites = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in
            (!showFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavorites, label: {
                    Text("Favorite Only")
                })
                
                ForEach(filteredLandmarks) {
                    landmark in
                    NavigationLink {
                        LandMarkDetail(landmark: landmark)
                    } label: {
                        LandMarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("LandMarks")
        } detail: {
            Text("Select a LandMark.")
        }
    }
}

#Preview {
    LandMarkList().environment(ModelData())
}
