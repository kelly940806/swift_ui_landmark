//
//  PageView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct PageView<Page:View>: View {
    var pages: [Page]
    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map{FeaturedCard(landmark: $0)})
}
