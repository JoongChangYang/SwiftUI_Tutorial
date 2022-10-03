//
//  LandmarkDetailView.swift
//  WatchLandmarks Watch App
//
//  Created by YJC on 2022/10/03.
//

import SwiftUI
import CoreLocation

struct LandmarkDetailView: View {
    @ObservedObject
    private var viewModel: LandmarkDetailViewModel
    
    init(viewModel: LandmarkDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack {
                self.imageView
                self.nameView
                self.favoriteButton
                Divider()
                self.parkView
                self.stateView
                Divider()
                self.mapView
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

extension LandmarkDetailView {
    @ViewBuilder
    private var imageView: some View {
        let image = Image(self.viewModel.state.landmark.imageName)
        CircleImage(image: image.resizable())
            .scaledToFill()
    }
    
    @ViewBuilder
    private var nameView: some View {
        Text(self.viewModel.state.landmark.name)
            .font(.headline)
            .lineLimit(0)
    }
    
    @ViewBuilder
    private var favoriteButton: some View {
        Toggle(isOn: self.$viewModel.state.landmark.isFavorite) {
            Text("Favorite")
        }
    }
    
    @ViewBuilder
    private var parkView: some View {
        Text(self.viewModel.state.landmark.park)
            .font(.caption)
            .bold()
            .lineLimit(0)
    }
    
    @ViewBuilder
    private var stateView: some View {
        Text(self.viewModel.state.landmark.state)
            .font(.caption)
    }
    
    @ViewBuilder
    private var mapView: some View {
        MapView(coordinate: self.viewModel.landmarkCoordinate)
            .scaledToFit()
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            LandmarkDetailView(viewModel: .init(landmark: LocalStorageService.landmarks[0]))
                .previewDevice("Apple Watch Series 5 - 44mm")
            
            LandmarkDetailView(viewModel: .init(landmark: LocalStorageService.landmarks[1]))
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
        
    }
}
