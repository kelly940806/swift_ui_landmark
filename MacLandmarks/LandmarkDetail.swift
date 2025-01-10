//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        // exclaimation remark to prevent null data
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var modelData = modelData
        // change to ScrollView to make all the content accessible (remember to remove the Spacer in the end!)
        ScrollView {
            ZStack {
                MapView(coordinates: landmark.locationCoordinates)
                    .frame(height: 300)
                Button("open in map") {
                    let dest = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinates))
                    dest.name = landmark.name
                    dest.openInMaps()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 20.0) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable()).frame(width: 160.0, height:160.0)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            // add '$' to pass the binding variable
                            FavoriteButton(
                                isSet: $modelData.landmarks[landmarkIndex]
                                    .isFavorite)
                            .buttonStyle(.plain)

                        }
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }

                }
                Divider()
                // inject the variable in string
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description).font(.body)
            }
            .padding()
            .frame(maxWidth: 700.0)
            .offset(y: -50.0)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview("Turtle Rock") {
    let modelData = ModelData()
    // return should be added when the block having multiple lines
    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(
        modelData
    )
    .frame(width: 850, height: 700)
}

#Preview("Golden Gate Bridge") {
    let modelData = ModelData()
    // return should be added when the block having multiple lines
    return LandmarkDetail(landmark: modelData.landmarks[1]).environment(
        modelData
    )
    .frame(width: 850, height: 700)
}
