//
//  ContentView.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height:300)
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About Turtle Rock").font(.title2)
                Text("details... ")
            }
            Spacer()
            
        }.padding(20)
    }
}

#Preview {
    ContentView()
}
