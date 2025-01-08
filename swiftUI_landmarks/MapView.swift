//
//  MapView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//
// 24.8047896,120.9749249
import SwiftUI
import MapKit

struct MapView: View {
    var coordinates: CLLocationCoordinate2D
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
    }
    
    var body: some View {
//        Map(initialPosition: .region(region))
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(coordinates: ModelData().landmarks[0].locationCoordinates)
}
