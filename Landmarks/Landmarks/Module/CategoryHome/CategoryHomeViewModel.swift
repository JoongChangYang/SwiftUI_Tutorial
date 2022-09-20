//
//  CategoryHomeViewModel.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import Foundation

final class CategoryHomeViewModel: ViewModel, ObservableObject {
    @Published var state: State
    
    init() {
        self.state = State()
    }
}

extension CategoryHomeViewModel {
    struct State {}
    
    enum Action {}
}

extension CategoryHomeViewModel {
    func action(_ action: Action) {
        
    }
}
