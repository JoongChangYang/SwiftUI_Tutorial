//
//  ObservableObjectTestViewModel.swift
//  Playground
//
//  Created by YJC on 2022/07/30.
//

import Foundation
import Combine

final class ObservableObjectTestViewModel: ObservableObject {
    private var store = Set<AnyCancellable>()
    @Published var count: Int
    
    @Published var alert = AlertModel.empty
    
    init(count: Int) {
        self.count = count
        self.bind()
        print("init \(self.count)")
    }
    
    deinit {
        print("deinit \(self.count)")
    }
    
    private func bind() {
        
    }
}

extension ObservableObjectTestViewModel {
    func addCount() {
        print(#function)
        self.count += 1
    }
    
    func showAlert() {
        print(#function)
        self.alert = AlertModel(title: "title",
                                message: "message -> \(self.count)",
                                okAction: { [weak self] in
            print("alert ok \(self?.count ?? -1)")
        },
                                cancelAction: { [weak self] in
            print("alert cancel \(self?.count ?? -1)")
        })
    }
}
