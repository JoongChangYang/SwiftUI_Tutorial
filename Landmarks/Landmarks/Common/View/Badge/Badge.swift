//
//  Badge.swift
//  Landmarks
//
//  Created by YJC on 2022/09/18.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
            .scaledToFit()
        }
    }
}

extension Badge {
    private var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees((Double(index) / 8.0) * 360))
        }
        .opacity(0.5)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
