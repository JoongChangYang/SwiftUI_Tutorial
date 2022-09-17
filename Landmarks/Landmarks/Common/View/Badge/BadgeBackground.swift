//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by YJC on 2022/09/01.
//

import SwiftUI

struct BadgeBackground: View {
    private let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    private let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        VStack() {
            GeometryReader { geometry in
                Path { path in
                    var width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    let xScale: CGFloat = 0.832
                    let xOffset = (width * (1.0 - xScale)) / 2.0
                    width *= xScale
                    
                    path.move(to: CGPoint(x: width * 0.95 + xOffset,
                                          y: height * (0.20 + HexagonParameters.adjustment)))
                    
                    HexagonParameters.segments.forEach { segment in
                        
                        path.addLine(to: CGPoint(x: width * segment.line.x + xOffset,
                                                 y: height * segment.line.y))
                        
                        path.addQuadCurve(to: CGPoint(x: width * segment.curve.x + xOffset,
                                                      y: height * segment.curve.y),
                                          control: CGPoint(x: width * segment.control.x + xOffset,
                                                           y: height * segment.control.y))
                    }
                }
                .fill(.linearGradient(Gradient(colors: [self.gradientStart, self.gradientEnd]),
                                      startPoint: UnitPoint(x: 0.5, y: 0),
                                      endPoint: UnitPoint(x: 0.5, y: 0.6)))
            }
            .aspectRatio(1, contentMode: .fit)
            
            GeometryReader { proxy in
                Path { path in
                    var width = proxy.size.width
                    let height = proxy.size.height
                    let center = proxy.size.width / 2
                    path.move(to: CGPoint(x: center, y: 0))
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                }
            }
            .background(Color.pink)
        }
        
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
