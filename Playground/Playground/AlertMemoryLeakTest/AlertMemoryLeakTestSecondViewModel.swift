//
//  AlertMemoryLeakTestSecondViewModel.swift
//  Playground
//
//  Created by YJC on 2022/07/31.
//

import Foundation
import Combine

final class AlertStore: ObservableObject {
    var alerts: [Published<AlertModel>] = []
    func store(model: AlertModel) {
        let new = Published(wrappedValue: model)
        self.alerts.append(new)
    }
}

final class AlertMemoryLeakTestSecondViewModel: ObservableObject {
    @Published var alert = AlertModel.empty
    @Published var alertPresented = false
    @Published var text = ""
    
    @Published var alerts: [Published<AlertModel>] = []
    
    let alertSubject = PassthroughSubject<AlertModel, Never>()
    
    private var closure: (() -> Void)?
    
    private let tag: Int
    init(tag: Int) {
        self.tag = tag
        print("init: \(self.tag)")
        
    }
    
    deinit {
        print("deinit: \(self.tag)")
    }
    
    func showAlert() {
        print(#function)
        let alert = AlertModel(title: "title",
                                message: "message",
                                okAction: { print("alert ok") },
                                cancelAction: { print("alert cancel") })
        
        self.alertSubject.send(alert)
    }
}
