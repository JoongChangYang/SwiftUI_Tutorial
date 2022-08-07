//
//  Landmark.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import Foundation

struct Landmark: Codable, Identifiable/*id 있어야함(Hashable)*/ {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    
    struct Coordinates: Codable {
        let latitude: Double
        let longitude: Double
    }
}
