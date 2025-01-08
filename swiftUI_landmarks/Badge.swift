//
//  Badge.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/8.
//

import SwiftUI

struct Badge: View {
    // define multiple rotated badge symbols
    var badgeSymbols: some View {
        // meaning for index from 0 to 7 and return [RotatedBadgeSymbol, ...]
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360
            )
            .opacity(0.5)
        }
    }

    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geomtry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(
                        x: geomtry.size.width / 2.0,
                        y: geomtry.size.height * (3.0 / 4.0))
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
