//
//  Item.swift
//  demo
//
//  Created by 钟钰 on 2024/6/7.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
