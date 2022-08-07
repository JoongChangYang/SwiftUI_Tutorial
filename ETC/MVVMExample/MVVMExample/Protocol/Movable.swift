//
//  Movable.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import Foundation

protocol Dismissable: AnyObject {
    func dismiss()
}

protocol MoveToDestination: Dismissable {
    associatedtype MoveTo: MoveToType
    var moveTo: MoveTo? { get set }
}

extension MoveToDestination {
    func dismiss() {
        self.moveTo = nil
    }
    
//    var navigationPresent: Bool {
//        get { self.moveTo?.isNavigation == true }
//        mutating set {
//            if !newValue {
//                self.moveTo = nil
//            }
//        }
//    }
//    
//    var popoverPresent: Bool {
//        get { self?.isPopover == true }
//        mutating set {
//            if !newValue {
//                self.moveTo = nil
//            }
//        }
//    }
//    
//    var sheetPresent: Bool {
//        get { self?.isSheet == true }
//        set {
//            if !newValue {
//                self = nil
//            }
//        }
//    }
}

protocol MoveToSource: AnyObject {
    var source: Dismissable? { get set }
}

extension MoveToSource {
    func dismissSelf() {
        self.source?.dismiss()
    }
}

typealias Movable = MoveToDestination & MoveToSource


