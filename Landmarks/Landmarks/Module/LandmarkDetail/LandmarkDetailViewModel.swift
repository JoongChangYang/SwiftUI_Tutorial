//
//  LandmarkDetailViewModel.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import Foundation
import Combine

final class LandmarkDetailViewModel: ObservableObject, ViewModel {
    @Published var state: State
    
    init(landmark: Landmark) {
        self.state = State(landmark: landmark)
    }
}

extension LandmarkDetailViewModel {
    struct State {
        var landmark: Landmark
    }
    enum Action {}
}

extension LandmarkDetailViewModel {
    func action(_ action: Action) {}
}
