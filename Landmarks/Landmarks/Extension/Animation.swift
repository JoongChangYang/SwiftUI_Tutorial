//
//  Animation.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        return .spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}
