//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct LandmarkListView: View {
    @ObservedObject private var viewModel = LandmarkListViewModel()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.state.landmarks) { landmark in
                NavigationLink {
                    LandmarkDetailView(viewModel: LandmarkDetailViewModel(landmark: landmark))
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
