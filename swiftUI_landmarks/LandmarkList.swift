//
//  LandmarkList.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct LandmarkList: View {
    // add a env variable for oberservable variable
    @Environment(ModelData.self) var modelData
    // add state for filter list
    @State private var showFavoriteOnly: Bool = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: {$0.id == selectedLandmark?.id})
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoriteOnly || landmark.isFavorite) && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoriteOnly ? "Favorite \(title)" : title
    }
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all="All"
        case lakes="Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        var id: FilterCategory{self}
    }

    var body: some View {
        // bind modelData into body
        @Bindable var modelData = modelData
        // iterate item in landmarks
        // (extract the id attribute automatically through Identifible protocol)
        NavigationSplitView {
            List (selection: $selectedLandmark) {
                // revise list iteration of landmarks to add the toggle into the list area
                ForEach(filteredLandmarks) {
                    landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }

            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(Text(title))
            .frame(minWidth: 300.0)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) {category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        Toggle(isOn: $showFavoriteOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            // detail block is required for NavigationSplitView closure (Only show in iPhone non portriat mode or other device)
            Text("Select a landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    // inject ModelData as environment variable for preview
    LandmarkList().environment(ModelData())
}
