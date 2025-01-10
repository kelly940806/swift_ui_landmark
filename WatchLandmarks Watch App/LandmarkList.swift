//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct LandmarkList: View {
    var landmark: Landmark
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkList(landmark: modelData.landmarks[0]).environment(ModelData())
}
