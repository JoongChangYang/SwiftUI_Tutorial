//
//  ViewModelBased.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import Foundation

protocol ViewModelBased {
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel { get set }
    init(_ viewModel: ViewModel)
}
