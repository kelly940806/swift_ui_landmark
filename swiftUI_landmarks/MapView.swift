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
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 24.8047896, longitude: 120.9749249),
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
    
    var body: some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    MapView()
}
