//
//  CategoryHome.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/8.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                // using listRowInsets to cover the reserved padding
                modelData.features[0].image
                    .resizable()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
//                HStack {
//                    ForEach(modelData.features) { landmark in
//                        landmark.image
//                            .resizable()
//                            .frame(height: 200)
//                            .clipped()
//                    }
//                }
                ForEach(modelData.categories.keys.sorted(), id: \.self) { catgKey in
                    // add the exclaimation mark to prevent items point to null
                    CategoryRow(categoryName: catgKey, items: modelData.categories[catgKey]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
        detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
