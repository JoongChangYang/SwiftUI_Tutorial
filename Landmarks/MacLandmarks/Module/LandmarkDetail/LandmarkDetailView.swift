//
//  LandmarkDetailView.swift
//  MacLandmarks
//
//  Created by YJC on 2022/10/07.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    @ObservedObject
    private var viewModel: LandmarkDetailViewModel
    
    private var landmark: Landmark { self.viewModel.state.landmark }
    
    init(viewModel: LandmarkDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            self.mapView
            
            VStack(alignment: .leading, spacing: 20) {
                self.headerView
                Divider()
                self.bodyView
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(self.landmark.name)
    }
}

extension LandmarkDetailView {
    @ViewBuilder
    private var mapView: some View {
        let alignment = Alignment(horizontal: .trailing, vertical: .top)
        
        ZStack(alignment: alignment) {
            MapView(coordinate: self.viewModel.landmarkCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            Button("Open in Maps") {
                let placemark = MKPlacemark(coordinate: self.viewModel.landmarkCoordinate)
                let destination = MKMapItem(placemark: placemark)
                destination.name = landmark.name
                destination.openInMaps()
            }
            .padding()
            
        }
    }
    
    @ViewBuilder
    private var imageView: some View {
        let image = Image(self.landmark.imageName).resizable()
        CircleImage(image: image)
            .frame(width: 160, height: 160)
    }
    
    @ViewBuilder
    private var titleView: some View {
        HStack {
            Text(self.landmark.name)
                .font(.title)
            
            FavoriteButton(isSet: self.$viewModel.state.landmark.isFavorite)
                .buttonStyle(.plain)
        }
    }
    
    @ViewBuilder
    private var subtitleView: some View {
        VStack(alignment: .leading) {
            Text(self.landmark.park)
            Text(self.landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
    
    @ViewBuilder
    private var headerView: some View {
        HStack(spacing: 24) {
            self.imageView
            VStack(alignment: .leading) {
                self.titleView
                self.subtitleView
            }
        }
    }
    
    @ViewBuilder
    private var bodyView: some View {
        Text("About \(self.landmark.name)")
            .font(.title2)
        Text(self.landmark.description)
    }
    
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LandmarkDetailViewModel(landmark: LandmarkDataService.shared.currentLandmarks[0])
        LandmarkDetailView(viewModel: viewModel)
            .frame(width: 850, height: 700)
    }
}
