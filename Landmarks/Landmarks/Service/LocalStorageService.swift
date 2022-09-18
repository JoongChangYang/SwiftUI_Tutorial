//
//  LocalStorageService.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import Foundation

struct LocalStorageService {
    static let landmarks: [Landmark] = load("landmarkData.json")
    static let hikes: [Hike] = load("hikeData.json")
    
    private static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("main bundle에서 \(filename)을 찾을 수 없습니다.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("\(filename)을 불러올 수 없습니다:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("파싱 에러 \(filename) -> \(T.self):\n\(error)")
        }
    }
}
