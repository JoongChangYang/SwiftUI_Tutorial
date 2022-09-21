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
    }
    
    enum Action {}
    func action(_ action: Action) {}
}

extension CategoryHomeViewModel {
    private func bind() {
        LandmarkDataService.shared.landmarksPublisher
            .map { list in
                Dictionary(grouping: list, by: { $0.category.rawValue })
            }
            .sink(receiveValue: { [weak self] categories in
                self?.state.categories = categories
            })
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
