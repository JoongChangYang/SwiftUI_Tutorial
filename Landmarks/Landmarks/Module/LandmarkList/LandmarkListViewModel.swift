//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import Foundation

final class LandmarkListViewModel: ObservableObject, ViewModel {
    @Published var state = State()
}

extension LandmarkListViewModel {
    struct State {
        var landmarks = LocalStorageService.landmarks
    }
    
    enum Action {
        
    }
}

extension LandmarkListViewModel {
    func action(_ action: Action) {
        
    }
}
