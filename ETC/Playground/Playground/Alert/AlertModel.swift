//
//  AlertModel.swift
//  RebornCar
//
//  Created by 양중창 on 2022/07/28.
//

import Foundation

struct AlertModel: Identifiable {
    var id: String { "\(isPresent)\(title)\(message ?? "nil")\(actions)" }
    var isPresent: Bool
    let title: String
    let message: String?
    let actions: [AlertActionModel]
}



extension AlertModel {
    static var empty: AlertModel {
        AlertModel(isPresent: false, title: "", message: "", actions: [])
    }
    
    init(title: String) {
        self.isPresent = true
        self.title = title
        self.message = nil
        self.actions = []
    }
    
    init(title: String, message: String) {
        self.isPresent = true
        self.title = title
        self.message = message
        self.actions = []
    }
    
    init(title: String, actions: [AlertActionModel]) {
        self.isPresent = true
        self.title = title
        self.message = nil
        self.actions = actions
    }
    
    init(title: String, message: String, actions: [AlertActionModel]) {
        self.isPresent = true
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    init(title: String, message: String? = nil, okAction: @escaping (() -> Void) = {}) {
        self.isPresent = true
        self.title = title
        self.message = message
        self.actions = [AlertActionModel(title: "확인", style: .default, action: okAction)]
    }
    
    init(title: String, message: String? = nil, okAction: @escaping (() -> Void) = {}, cancelAction: @escaping (() -> Void) = {}) {
        self.isPresent = true
        self.title = title
        self.message = message
        self.actions = [AlertActionModel(title: "확인", style: .default, action: okAction),
                        AlertActionModel(title: "취소", style: .cancel, action: cancelAction)]
    }
}
