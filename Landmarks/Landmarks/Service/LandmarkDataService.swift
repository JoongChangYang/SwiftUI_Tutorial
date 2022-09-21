//
//  LandmarkDataService.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import Foundation
import Combine

final class LandmarkDataService {
    static let shared = LandmarkDataService()
    private init() {}
    
    private let landmarks = CurrentValueSubject<[Landmark], Never>(LocalStorageService.landmarks)
}

extension LandmarkDataService {
    var landmarksPublisher: AnyPublisher<[Landmark], Never> {
        return self.landmarks.eraseToAnyPublisher()
    }
    
    var currentLandmarks: [Landmark] {
        self.landmarks.value
    }
    
    func updateLandmark(_ landmark: Landmark) {
        var result = self.landmarks.value
        guard let index = result.firstIndex(where: { $0.id == landmark.id && $0.isFavorite != landmark.isFavorite }) else { return }
        result[index] = landmark
        self.landmarks.send(result)
    }
}
