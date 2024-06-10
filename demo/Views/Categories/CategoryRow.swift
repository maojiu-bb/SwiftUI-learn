//
//  CategoryRow.swift
//  demo
//
//  Created by 钟钰 on 2024/6/8.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) {
                        item in
                        NavigationLink {
                            LandMarkDetail(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                })
            }
            .frame(height: 185)
        })
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    
    return CategoryRow(
        categoryName: landmarks[1].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
