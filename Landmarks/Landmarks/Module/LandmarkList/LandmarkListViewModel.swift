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
    @Published var state = State()
}

extension LandmarkListViewModel {
    struct State {
        var landmarks = LocalStorageService.landmarks
        var showFavoritesOnly = false
    }
    
    enum Action {
        
    }
}

extension LandmarkListViewModel {
    func action(_ action: Action) {
    }
}

extension LandmarkListViewModel {
    var filteredLandmarks: [Landmark] {
        self.state.landmarks.filter { landmark in
            return !self.state.showFavoritesOnly || landmark.isFavorite
        }
    }
    
    func detailViewModel(landmark: Landmark) -> LandmarkDetailViewModel {
        let viewModel = LandmarkDetailViewModel(landmark: landmark)
        viewModel.$state
            .map { $0.landmark }
            .sink(receiveValue: { [weak self] landmark in
                guard let index = self?.state.landmarks.firstIndex(where: { $0.id == landmark.id && $0.isFavorite != landmark.isFavorite }) else { return }
                self?.state.landmarks[index] = landmark
            })
            .store(in: &self.cancelStore)
        return viewModel
    }
}
