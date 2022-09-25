//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import Foundation
import Combine

final class LandmarkListViewModel: ObservableObject, ViewModel {
    private var cancelStore = Set<AnyCancellable>()
    
    @Published
    var state = State()
    
    init() {
        self.bind()
    }
}

extension LandmarkListViewModel {
    struct State {
        var landmarks = LocalStorageService.landmarks
        var showFavoritesOnly = false
    }
    
    enum Action {}
    func action(_ action: Action) {}
}

extension LandmarkListViewModel {
    private func bind() {
        LandmarkDataService.shared.landmarksPublisher
            .assign(to: \.state.landmarks, on: self)
            .store(in: &self.cancelStore)
    }
}

extension LandmarkListViewModel {
    var filteredLandmarks: [Landmark] {
        self.state.landmarks.filter { landmark in
            return !self.state.showFavoritesOnly || landmark.isFavorite
        }
    }
    
    func detailViewModel(landmark: Landmark) -> LandmarkDetailViewModel {
        return LandmarkDetailViewModel(landmark: landmark)
    }
}
