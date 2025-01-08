/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// customize view Transation
extension AnyTransition {
    static var moveAndFace: AnyTransition {
        // AnyTransition.slide
        // AnyTransition.move(edge: .trailing)
        // use asymmetric to define different animations for move in and move out
        // use combined to chain multiple animation behavior
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
        
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    // A global way to add the animation for value change (affect all the animation of the view)
                    withAnimation(.easeInOut(duration: 2.0)) {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        // only affect the Label
                        // .animation(.easeInOut(duration: 3.0), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike).transition(.moveAndFace)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
