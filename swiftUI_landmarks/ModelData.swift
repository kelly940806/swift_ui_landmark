//
//  ModelData.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import Foundation

var landmarks:[Landmark]=load("landmarkData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    // using guard to garantee the file exists else raise the exception
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