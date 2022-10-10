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
        var filter = FilterCategory.all
        var selectedLandmark: Landmark?
    }
    
    enum Action {}
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
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
    var title: String {
        let filter = self.state.filter
        let title = filter == .all ? "Landmarks": filter.rawValue
        return self.state.showFavoritesOnly ? "Favorite \(title)": title
    }
    
    var filteredLandmarks: [Landmark] {
        self.state.landmarks.filter { landmark in
            return (!self.state.showFavoritesOnly || landmark.isFavorite)
            && (self.state.filter == .all || self.state.filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var selectedLandmarkIndex: Int {
        self.state.landmarks.firstIndex { $0.id == self.state.selectedLandmark?.id } ?? 0
    }
    
    func detailViewModel(landmark: Landmark) -> LandmarkDetailViewModel {
        return LandmarkDetailViewModel(landmark: landmark)
    }
}
