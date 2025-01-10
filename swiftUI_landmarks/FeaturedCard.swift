//
//  FeaturedCard.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct FeaturedCard: View {
    var landmark: Landmark
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.5), .gray.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottomLeading
        ) {
            gradient
            VStack (alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .foregroundStyle(Color.white)
        }
    }

}

#Preview {
    FeaturedCard(landmark: ModelData().landmarks[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
