//
//  ViewModelType.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import Foundation

protocol ViewModelType: AnyObject {
    associatedtype State
    associatedtype Action
    
    var state: State { get set }
    
    func action(_ action: Action)
}
