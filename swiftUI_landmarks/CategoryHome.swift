//
//  CategoryHome.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/8.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                // using listRowInsets to cover the reserved padding
                PageView(pages: modelData.features.map{FeaturedCard(landmark: $0)}).listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    catgKey in
                    // add the exclaimation mark to prevent items point to null
                    CategoryRow(
                        categoryName: catgKey,
                        items: modelData.categories[catgKey]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            // sheet is like the pop up modal
            .sheet(isPresented: $showProfile) {
                ProfileHost().environment(modelData)
            }
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
