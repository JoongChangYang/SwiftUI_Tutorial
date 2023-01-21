//
//  AlertActionModel.swift
//  RebornCar
//
//  Created by 양중창 on 2022/07/29.
//

import Foundation

struct AlertActionModel: Identifiable {
    var id: String { "\(title)\(style)" }
    let title: String
    let style: AlertActionStyle
    let action: (() -> Void)
}

extension AlertActionModel {
    static func `default`(title: String, action: @escaping (() -> Void) = {}) -> AlertActionModel {
        return .init(title: title, style: .default, action: action)
    }
    
    static func cancel(title: String, action: @escaping (() -> Void) = {}) -> AlertActionModel {
        return .init(title: title, style: .cancel, action: action)
    }
    
    static func destructive(title: String, action: @escaping (() -> Void) = {}) -> AlertActionModel {
        return .init(title: title, style: .destructive, action: action)
    }
}

enum AlertActionStyle {
    case `default`
    case cancel
    case destructive
}
