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
                .cornerRadius(5.0)
            VStack (alignment: .leading) {
                Text(landmark.name)
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 2)
    }
}

#Preview("Turtle Rock") {
    LandmarkRow(landmark: ModelData().landmarks[0])
}

#Preview("Salmon Creek") {
    LandmarkRow(landmark: ModelData().landmarks[1])
}

#Preview("Display Multiple") {
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
        LandmarkRow(landmark: ModelData().landmarks[2])
    }
}
