//
//  FavoriteButton.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/8.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favortie", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
    FavoriteButton(isSet: .constant(false))
}
