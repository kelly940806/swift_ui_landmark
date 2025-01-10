//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image:landmark.image.resizable()).scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            Divider()
            Text(message ?? "You are within 5 mildes away from your favorite landmarks")
                .font(.caption)
            
        }
    }
}

#Preview("Unkown") {
    NotificationView()
}

#Preview("Turtle Rock") {
    let landmark = ModelData().landmarks[0]
    NotificationView(title:landmark.name, message: "You are within 4 miles away from \(landmark.name)", landmark: landmark)
}
