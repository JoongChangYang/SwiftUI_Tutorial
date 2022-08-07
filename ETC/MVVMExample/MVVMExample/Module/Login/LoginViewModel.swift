//
//  LoginViewModel.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import Foundation

final class LoginViewModel: ObservableObject, ViewModelType, MoveToDestination {
    @Published var state: State = State()
    @Published var moveTo: MoveTo?
}

extension LoginViewModel {
    enum MoveTo: MoveToType {
        case detail(DetailViewModel)
    }
    
    struct State {
        var id: String = ""
        var password: String = ""
    }
    
    enum Action {
        case login
    }
}

extension LoginViewModel {
    func action(_ action: Action) {
        switch action {
        case .login:
            self.login()
        }
    }
}

extension LoginViewModel {
    private func login() {
        let detailViewModel = DetailViewModel(source: self, id: state.id, password: state.password)
        self.moveTo = .detail(detailViewModel)
    }
}

