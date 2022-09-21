//
//  Profile.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import Foundation

struct Profile {
    let userName: String
    let prefersNotifications = true
    let seasonalPhoto = Season.winter
    let goalDate = Date()
    
    static let `default` = Profile(userName: "양중창")
}

extension Profile {
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
