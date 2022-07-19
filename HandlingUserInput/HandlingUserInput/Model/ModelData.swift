//
//  ModelData.swift
//  HandlingUserInput
//
//  Created by YJC on 2022/07/20.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = LocalStorageService.load("landmarkData.json")
}
