//
//  ProfileHost.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/9.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
