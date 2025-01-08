//
//  BadgeBackground.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/8.
//

import CoreGraphics
import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width*(1.0-xScale))/2.0
                width *= xScale
                path.move(to: CGPoint(
                    x: width * 0.95 + xOffset,
                    y: height * (0.2 + HexagonalParameters.adjustment)))
                HexagonalParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y))
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y)
                    )
                }
            }
            // setup the gradient color
            .fill(.linearGradient(colors:[Self.gradientStart, Self.gradientEnd],
                                  startPoint: UnitPoint(x: 0.5, y: 0),
                                  endPoint: UnitPoint(x: 0.5, y: 0.5)))
        }.aspectRatio(1, contentMode: .fit)
    }
    // prepare gradient start/end color
    static let gradientStart = Color(red: 239.0/255, green: 129.0/255, blue: 221.0/255)
    static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
}

#Preview {
    BadgeBackground()
}
