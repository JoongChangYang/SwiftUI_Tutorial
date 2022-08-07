//
//  Landmark.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import Foundation

struct Landmark: Codable, Identifiable {
    let id: Int // Identifiable 선언 프로퍼티
    let name: String
    let park: String
    let state: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    var isFavorite: Bool
    
    struct Coordinates: Codable {
        let latitude: Double
        let longitude: Double
    }
}
