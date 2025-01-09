//
//  ModelData.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    // categories is dictionary which using all the landmarks and group by its category data
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }
    // features is array of landmark to filter the featured landmark only
    var features: [Landmark] { landmarks.filter { $0.isFeatured } }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    // using guard to guarantee the file exists else raise the exception
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    // try transforming the json file to data object
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(
            "Could not load \(filename) in main bundle.: error as:\n \(error)")
    }

    // try decoding the data to T protocol with json decoder
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(
            "Could not parse \(filename) as \(T.self): error as:\n \(error)")
    }

}
