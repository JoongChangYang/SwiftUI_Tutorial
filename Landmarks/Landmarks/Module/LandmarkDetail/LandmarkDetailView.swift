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
                MapView(coordinate: .init(latitude: self.viewModel.state.landmark.coordinates.latitude,
                                          longitude: self.viewModel.state.landmark.coordinates.longitude))
                .frame(height: 300)
                .ignoresSafeArea()
                
                CircleImage(image: Image(self.viewModel.state.landmark.imageName))
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                // spacing: VStack 안에 있는 뷰들 사이의 간격
                VStack(alignment: .leading, spacing: 10) {
                    self.titleView()
                    Divider() // 구분선
                    self.descriptionView()
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle(self.viewModel.state.landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
            
    }
}

extension LandmarkDetailView {
    private func titleView() -> some View {
        let titleText = Text(self.viewModel.state.landmark.name)
            .font(.title)
        
        let subTitleView = HStack {
            Text(self.viewModel.state.landmark.park)
            Spacer() // 가운데 여백
            Text(self.viewModel.state.landmark.state)
        }
            .font(.subheadline)
            .foregroundColor(.secondary)
        
        let result = TupleView((titleText, subTitleView))
        return result
    }
    
    private func descriptionView() -> some View {
        let descriptionTitleText = Text("About \(self.viewModel.state.landmark.name)")
            .font(.title2)
        
        let descriptionText = Text(self.viewModel.state.landmark.description)
        
        let result = TupleView((descriptionTitleText, descriptionText))
        return result
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(viewModel: .init(landmark: LocalStorageService.landmarks[0]))
    }
}
