//
//  swiftUI_landmarksApp.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

@main
struct swiftUI_landmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

    }
}
