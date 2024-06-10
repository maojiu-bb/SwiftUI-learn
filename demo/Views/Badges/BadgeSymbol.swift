//
//  BadgeSymbol.swift
//  demo
//
//  Created by 钟钰 on 2024/6/8.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        GeometryReader {
            geometry in
            Path {
                path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHight = height * 0.488
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHight - spacing),
                    CGPoint(x: middle, y: topHight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHight / 2 + spacing * 3))
                
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHight + spacing),
                    CGPoint(x: middle, y: topHight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

#Preview {
    BadgeSymbol()
}
