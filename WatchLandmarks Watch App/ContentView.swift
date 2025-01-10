//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            // task will be taken while render the LandmarkList
            .task {
                let center = UNUserNotificationCenter.current()
                // should add unsed return definition then the await would work
                _ = try? await center.requestAuthorization(options: [.alert, .sound, .badge])
            }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
