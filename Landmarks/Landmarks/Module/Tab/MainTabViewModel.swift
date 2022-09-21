//
//  MainTabViewModel.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import Foundation

final class MainTabViewModel: ViewModel, ObservableObject {
    @Published
    var state: State
    
    private let categoryViewModel: CategoryHomeViewModel
    private let listViewModel: LandmarkListViewModel
    
    init() {
        self.state = State()
        self.categoryViewModel = CategoryHomeViewModel()
        self.listViewModel = LandmarkListViewModel()
    }
}

extension MainTabViewModel {
    struct State {
        var tab: Tab = .featured
    }
    enum Action {}
    
    enum Tab {
        case featured
        case list
    }
}

extension MainTabViewModel {
    func action(_ action: Action) {
        
    }
}

extension MainTabViewModel {
    var category: CategoryHomeViewModel {
        return self.categoryViewModel
    }
    
    var list: LandmarkListViewModel {
        return self.listViewModel
    }
}
