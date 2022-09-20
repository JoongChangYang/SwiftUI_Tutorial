//
//  HikeViewModel.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import Foundation

final class HikeViewModel: ViewModel, ObservableObject {
    @Published var state: State
    
    init(hike: Hike) {
        self.state = State(hike: hike)
    }
}

extension HikeViewModel {
    struct State {
        var hike: Hike
        var showDetail = false
    }
    
    enum Action {
        case detail
    }
}

extension HikeViewModel {
    func action(_ action: Action) {
        switch action {
        case .detail:
            self.state.showDetail.toggle()
        }
    }
}
