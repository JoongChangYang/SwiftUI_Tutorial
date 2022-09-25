//
//  CategoryHomeViewModel.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import Foundation
import Combine

final class CategoryHomeViewModel: ViewModel, ObservableObject {
    private var cancelBag = Set<AnyCancellable>()
    
    @Published
    var state: State
    
    init() {
        self.state = State()
        self.bind()
    }
}

extension CategoryHomeViewModel {
    struct State {
        var categories: [String: [Landmark]] = [:]
        var showProfile = false
    }
    
    enum Action {
        case profile
    }
    
    func action(_ action: Action) {
        switch action {
        case .profile:
            self.state.showProfile.toggle()
        }
    }
}

extension CategoryHomeViewModel {
    private func bind() {
        LandmarkDataService.shared.landmarksPublisher
            .map { list in
                Dictionary(grouping: list, by: { $0.category.rawValue })
            }
            .assign(to: \.state.categories, on: self)
            .store(in: &self.cancelBag)
    }
}

extension CategoryHomeViewModel {
    var featuredLandmark: Landmark? {
        return LocalStorageService.landmarks.filter { $0.isFeatured }.first
    }
    
    func landmarkItems(key: String) -> [Landmark] {
        return self.state.categories[key] ?? []
    }
}
