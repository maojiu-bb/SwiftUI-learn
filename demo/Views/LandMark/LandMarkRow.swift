//
//  LandMarkRow.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
            .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            FavoriteButton(isSet: .constant(landmark.isFavorite))
        }
    }
}

#Preview {
    let landmarks: [Landmark] = ModelData().landmarks
    return Group {
        LandMarkRow(landmark: landmarks[1])
        LandMarkRow(landmark: landmarks[2])
    }
}
