//
//  AnyTransition.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        return .asymmetric(insertion: .move(edge: .trailing),
                           removal: .scale.combined(with: .opacity))
    }
}
