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
        NavigationSplitView {
            List(landmarks) {
                landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                }
                label: {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            .navigationTitle(Text("Landmarks"))
        } detail: {
            // detail block is required for NavigationSplitView closure (Only show in iPhone non portriat mode or other device)
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
