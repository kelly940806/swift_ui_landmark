//
//  CircleImage.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 2.5)
            }
            .shadow(radius: 10.0)
    }
}

#Preview {
    CircleImage(image: ModelData().landmarks[0].image)
}
