//
//  Profile.swift
//  demo
//
//  Created by 钟钰 on 2024/6/10.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var golDate = Date()
    
    static let `default` = Profile(username: "MaoJiu")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {
            rawValue
        }
    }
}
