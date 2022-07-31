//
//  PresentTestViewModel.swift
//  MVVMExample
//
//  Created by YJC on 2022/08/01.
//

import Foundation

final class PresentTestViewModel: ObservableObject, ViewModelType, MoveToSource {
    weak var source: Dismissable?
    
    @Published var state: State
    
    init(title: String) {
        self.state = State(title: title)
    }
}

extension PresentTestViewModel {
    struct State {
        let title: String
    }
    
    enum Action {
        case dismiss
    }
}

extension PresentTestViewModel {
    func action(_ action: Action) {
        switch action {
        case .dismiss: self.dismissSelf()
        }
    }
}
