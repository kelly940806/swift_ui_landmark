//
//  ProfileSummary.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/9.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData

    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notification: \(profile.prefersNotification ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
            }
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 180))
                        HikeBadge(name: "Tenth Hike")
                            .hueRotation(Angle(degrees: 20))
                        HikeBadge(name: "First Bike")
                            .hueRotation(Angle(degrees: 300))
                        HikeBadge(name: "Tenth Bike")
                            .hueRotation(Angle(degrees: 330))
                    }
                    .padding(.bottom)
                }
            }
            Divider()
            VStack (alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
