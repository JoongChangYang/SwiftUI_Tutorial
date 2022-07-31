//
//  MoveToType.swift
//  MVVMExample
//
//  Created by YJC on 2022/08/01.
//

import Foundation

enum MoveToStyle {
    case navigation
    case sheet
    case popover
}

protocol MoveToType {
    var style: MoveToStyle { get }
}

extension MoveToType {
    var style: MoveToStyle {
        return .navigation
    }
    
    var isNavigation: Bool {
        switch self.style {
        case .navigation: return true
        default: return false
        }
    }
    
    var isPopover: Bool {
        switch self.style {
        case .popover: return true
        default: return false
        }
    }
    
    var isSheet: Bool {
        switch self.style {
        case .sheet: return true
        default: return false
        }
    }
}

extension Optional where Wrapped: MoveToType {
    var navigationPresent: Bool {
        get { self?.isNavigation == true }
        mutating set {
            if !newValue {
                self = nil
            }
        }
    }
    
    var popoverPresent: Bool {
        get { self?.isPopover == true }
        mutating set {
            if !newValue {
                self = nil
            }
        }
    }
    
    var sheetPresent: Bool {
        get { self?.isSheet == true }
        mutating set {
            if !newValue {
                self = nil
            }
        }
    }
}
