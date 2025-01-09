//
//  ContentView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct ContentView: View {
    // set the Tab enum and selected tab state
    @State private var selectedTab: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        // Add TabView component to control the view changes
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
    }
}

#Preview {
    ContentView().environment(ModelData())
}
