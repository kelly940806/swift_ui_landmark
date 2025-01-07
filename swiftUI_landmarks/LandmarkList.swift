//
//  LandmarkList.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // iterate item in landmarks
        // (extract the id attribute automatically through Identifible protocol)
        List(landmarks) {
            landmark in LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}
