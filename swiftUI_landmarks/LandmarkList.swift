//
//  LandmarkList.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkList: View {
    // add state for filter list
    @State private var showFavoriteOnly:Bool = false
//    var filteredLandmarks: [Landmark] {
//        landmarks.filter { showFavoriteOnly ? $0.isFavorite : true }
//    }
    var filteredLandmarks: [Landmark] {
        landmarks.filter {
            landmark in (!showFavoriteOnly||landmark.isFavorite)
        }
    }
    
    var body: some View {
        // iterate item in landmarks
        // (extract the id attribute automatically through Identifible protocol)
        NavigationSplitView {
            List{
                // add toggle for control favorite filter with binding property (should be with '$')
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorite Only")
                }
                
                // revise list iteration of landmarks to add the toggle into the list area
                ForEach(filteredLandmarks) {
                    landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    }
                    label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
                
                
            }
            .animation(.default, value: filteredLandmarks)
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
