//
//  ProfileHost.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/9.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
