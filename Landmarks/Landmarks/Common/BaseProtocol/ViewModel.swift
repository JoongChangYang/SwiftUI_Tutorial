//
//  ViewModel.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import Foundation

protocol ViewModel {
    associatedtype State
    associatedtype Action
    
    var state: State { get set }
    func action(_ action: Action)
}
