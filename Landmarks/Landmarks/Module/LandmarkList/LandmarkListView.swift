//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct LandmarkListView: View {
    @ObservedObject
    private var viewModel: LandmarkListViewModel
    
    init(viewModel: LandmarkListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Toggle(isOn: self.$viewModel.state.showFavoritesOnly,
                       label: {
                    Text("Faivotrites only")
                })
                
                ForEach(self.viewModel.filteredLandmarks, content: { landmark in
                    NavigationLink(destination: {
                        self.detailView(landmark)
                    }, label: {
                        LandmarkRow(landmark: landmark)
                    })
                    
                })
            }
            .navigationTitle("Landmarks")
        }
    }
}

extension LandmarkListView {
    @ViewBuilder
    private func detailView(_ landmrk: Landmark) -> some View {
        let viewModel = self.viewModel.detailViewModel(landmark: landmrk)
        LandmarkDetailView(viewModel: viewModel)
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(viewModel: LandmarkListViewModel())
    }
}
