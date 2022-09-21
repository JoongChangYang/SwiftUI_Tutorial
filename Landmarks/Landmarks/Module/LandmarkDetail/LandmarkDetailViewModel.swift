//
//  LandmarkDetailViewModel.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import Foundation
import Combine

final class LandmarkDetailViewModel: ObservableObject, ViewModel {
    private var cancelStore = Set<AnyCancellable>()
    
    @Published
    var state: State
    
    init(landmark: Landmark) {
        self.state = State(landmark: landmark)
        self.bind()
    }
}

extension LandmarkDetailViewModel {
    struct State {
        var landmark: Landmark
    }
    
    enum Action {}
    func action(_ action: Action) {}
}

extension LandmarkDetailViewModel {
    private func bind() {
        self.$state
            .map { $0.landmark }
            .sink(receiveValue: { landmark in
                LandmarkDataService.shared.updateLandmark(landmark)
            })
            .store(in: &self.cancelStore)
    }
}
