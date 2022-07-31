//
//  AlertMemoryLeakTestFirstViewModel.swift
//  Playground
//
//  Created by YJC on 2022/07/31.
//

import Foundation

final class AlertMemoryLeakTestFirstViewModel: ObservableObject {
    @Published var moveTo: MoveTo?
    
    func push() {
        self.moveTo = .second
    }
}

extension AlertMemoryLeakTestFirstViewModel {
    enum MoveTo {
        case second
    }
}
