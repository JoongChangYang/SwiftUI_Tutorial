/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    @ObservedObject
    private var viewModel: HikeViewModel
    
    init(viewModel: HikeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: self.viewModel.state.hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(self.viewModel.state.hike.name)
                        .font(.headline)
                    Text(self.viewModel.state.hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation {
                        self.viewModel.action(.detail)
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(self.viewModel.state.showDetail ? 90 : 0))
                        .scaleEffect(self.viewModel.state.showDetail ? 1.5: 1)
                        .padding()
                }

            }

            if self.viewModel.state.showDetail {
                HikeDetail(hike: self.viewModel.state.hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            let hike = LocalStorageService.hikes[0]
            HikeView(viewModel: HikeViewModel(hike: hike))
                .padding()
            Spacer()
        }
    }
}
