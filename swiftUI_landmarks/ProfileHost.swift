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
                if editMode?.wrappedValue == .active {
                    // restore the original data for draftProfile
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        // change the editMode to inactive with animation
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // using current profile as draftProfile for editing (onAppear)
                // save the modified draftProfile to current profile after editing (onDisppear)
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
