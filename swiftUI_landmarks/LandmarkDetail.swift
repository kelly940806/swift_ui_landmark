//
//  LandmarkDetail.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        // change to ScrollView to make all the content accessible (remember to remove the Spacer in the end!)
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                // inject the variable in string
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description).font(.body)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Turtle Rock") {
    LandmarkDetail(landmark: landmarks[0])
}

#Preview("Golden Gate Bridge") {
    LandmarkDetail(landmark: landmarks[1])
}
