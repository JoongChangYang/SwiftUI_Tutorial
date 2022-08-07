//
//  DetailViewModel.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import Foundation

final class DetailViewModel: ObservableObject, ViewModelType, Movable {
    weak var source: Dismissable?
    @Published var state: State
    @Published var moveTo: MoveTo? {
        didSet {
            print("updated moveTo: \(moveTo.navigationPresent)")
        }
    }
    
    init(source: Dismissable?, id: String, password: String) {
        print("DetailViewModel init")
        self.source = source
        self.state = State(id: id, password: password)
    }
    
    deinit {
        print("DetailViewModel deinit")
    }
}

extension DetailViewModel {
    enum MoveTo: MoveToType {
        case navi(PresentTestViewModel)
        case popover(PresentTestViewModel)
        case sheet(PresentTestViewModel)
        
        var style: MoveToStyle {
            switch self {
            case .navi: return .navigation
            case .popover: return .popover
            case .sheet: return .sheet
            }
        }
    }
    
    struct State {
        let title = "Detail"
        let id: String
        let password: String
        var alertModel = AlertModel.empty
    }
    
    enum Action {
        case dismiss
        case navi
        case popover
        case sheet
    }
}

extension DetailViewModel {
    func action(_ action: Action) {
        switch action {
        case .dismiss:
            self.back()
        case .navi:
            let viewModel = PresentTestViewModel(title: "navi")
            viewModel.source = self
            self.moveTo = .navi(viewModel)
        case .sheet:
            let viewModel = PresentTestViewModel(title: "sheet")
            viewModel.source = self
            self.moveTo = .sheet(viewModel)
        case .popover:
            let viewModel = PresentTestViewModel(title: "popover")
            viewModel.source = self
            self.moveTo = .popover(viewModel)
        }
    }
}

extension DetailViewModel {
    private func back() {
        state.alertModel = AlertModel(title: "알림",
                                      message: "뒤로 갈래?",
                                      okAction: { [weak self] in
            self?.dismissSelf()
        },
                                      cancelAction: {})
    }
}
