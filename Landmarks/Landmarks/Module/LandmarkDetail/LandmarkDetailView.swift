//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct LandmarkDetailView: View {
    @ObservedObject private var viewModel: LandmarkDetailViewModel
    
    init(viewModel: LandmarkDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                self.mapView
                self.imageView
                self.contentView
                .padding()
                
                Spacer()
            }
            .navigationTitle(self.viewModel.state.landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
            
    }
}

extension LandmarkDetailView {
    @ViewBuilder
    private var mapView: some View {
        MapView(coordinate: .init(latitude: self.viewModel.state.landmark.coordinates.latitude,
                                  longitude: self.viewModel.state.landmark.coordinates.longitude))
        .frame(height: 300)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private var imageView: some View {
        CircleImage(image: Image(self.viewModel.state.landmark.imageName))
            .offset(y: -130)
            .padding(.bottom, -130)
    }
    
    @ViewBuilder
    private var contentView: some View {
        // spacing: VStack 안에 있는 뷰들 사이의 간격
        VStack(alignment: .leading, spacing: 10) {
            self.titleView
            self.subtitleView
            Divider() // 구분선
            self.descriptionView
        }
    }
    
    @ViewBuilder
    private var titleView: some View {
        HStack {
            Text(self.viewModel.state.landmark.name)
                .font(.title)
            
//            FavoriteButton(isSet: self.$listViewModel.state.landmarks[self.landmarkIndex].isFavorite)
            FavoriteButton(isSet: self.$viewModel.state.landmark.isFavorite)
        }
    }
    
    @ViewBuilder
    private var subtitleView: some View {
        HStack {
            Text(self.viewModel.state.landmark.park)
            Spacer() // 가운데 여백
            Text(self.viewModel.state.landmark.state)
        }
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    @ViewBuilder
    var descriptionView: some View {
        Text("About \(self.viewModel.state.landmark.name)")
            .font(.title2)
        Text(self.viewModel.state.landmark.description)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(viewModel: .init(landmark: LocalStorageService.landmarks[0]))
    }
}
