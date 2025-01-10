//
//  ContentView.swift
//  MacLandmarks
//
//  Created by UCOM-08 on 2025/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList().frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView().environment(ModelData())
}
