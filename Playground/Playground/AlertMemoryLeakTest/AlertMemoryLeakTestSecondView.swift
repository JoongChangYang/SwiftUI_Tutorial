//
//  AlertMemoryLeakTestSecondView.swift
//  Playground
//
//  Created by YJC on 2022/07/31.
//

import SwiftUI
import Combine

struct AlertMemoryLeakTestSecondView: View {
    private var store = Set<AnyCancellable>()
    @ObservedObject private var viewModel: AlertMemoryLeakTestSecondViewModel
    @State private var alert = AlertModel.empty
    
    init(tag: Int) {
        self._viewModel = ObservedObject(wrappedValue: AlertMemoryLeakTestSecondViewModel(tag: tag))
        self.bind()
    }
    
    var body: some View {
        VStack {
            Button("alert", action: {
                self.viewModel.showAlert()
            })
        }
        .alert(model: self.$alert)
    }
}

extension AlertMemoryLeakTestSecondView {
    mutating private func bind() {
        
        self.viewModel.alertSubject
            .print()
            .assign(to: \.alert, on: self)
            .store(in: &self.store)
    }
}

struct AlertMemoryLeakTestSecondView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMemoryLeakTestSecondView(tag: 1)
    }
}
