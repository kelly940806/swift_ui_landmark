//
//  File.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import Foundation
// especially for CLLocationCoordinate2D
import MapKit
// especially for Image
import SwiftUI

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

// Codable will auto extract the key from json file
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool = false
    var isFeatured: Bool = false

    var category: Category
    // prepare a enum struct for category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    // prepare image from Asset with imageName of json file
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    // prepare coordinates from coordinates of json file
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
