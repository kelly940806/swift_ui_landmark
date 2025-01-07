//
//  SwiftUIView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:50.0, height: 50.0)
            Text(landmark.name)
            Spacer()
//            Text(landmark.park)
        }
    }
}

#Preview {
    LandmarkRow(landmark: landmarks[1])
}