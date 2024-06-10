//
//  LandMarkDetail.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import SwiftUI
import MapKit

struct LandMarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    @State private var text = ""
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
        
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 350)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, content: {
                HStack {
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    FavoriteButton(isSet: .constant(landmark.isFavorite))
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
                TextField(LocalizedStringKey("Please input text"), text: $text)
            })
            .padding()
        }
        .ignoresSafeArea(edges: [.horizontal, .top])
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandMarkDetail(landmark: modelData.landmarks[1]).environment(modelData)
}
