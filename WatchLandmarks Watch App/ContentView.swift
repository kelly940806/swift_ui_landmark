//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}
