//
//  LandmarkDetail.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        // exclaimation remark to prevent null data
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        @Bindable var modelData = modelData
        // change to ScrollView to make all the content accessible (remember to remove the Spacer in the end!)
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // add '$' to pass the binding variable
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    
                }
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
    let modelData = ModelData()
    // return should be added when the block having multiple lines
    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
}

#Preview("Golden Gate Bridge") {
    let modelData = ModelData()
    // return should be added when the block having multiple lines
    return LandmarkDetail(landmark: modelData.landmarks[1]).environment(modelData)
}
