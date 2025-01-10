//
//  PageView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct PageView<Page:View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    var body: some View {
        PageViewController(currentPage: $currentPage, pages: pages)
            .aspectRatio(3/2, contentMode: .fit)
        Text("CurrentPage \(currentPage)")
    }
}

#Preview {
    PageView(pages: ModelData().features.map{FeaturedCard(landmark: $0)})
}
