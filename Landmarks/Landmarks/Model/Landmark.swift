//
//  Landmark.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import Foundation

struct Landmark: Codable, Hashable, Identifiable/*id 있어야함(Hashable)*/ {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    let category: Category
    var isFavorite: Bool
    let isFeatured: Bool
    
    var featureImageName: String? {
        self.isFeatured ? self.imageName + "_feature": nil
    }
}

extension Landmark {
    struct Coordinates: Codable, Hashable {
        let latitude: Double
        let longitude: Double
    }
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
