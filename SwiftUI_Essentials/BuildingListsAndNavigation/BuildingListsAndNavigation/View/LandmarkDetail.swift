//
//  LandmarkDetail.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/12.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: .init(latitude: landmark.coordinates.latitude,
                                          longitude: landmark.coordinates.longitude))
                .frame(height: 300)
                .ignoresSafeArea()
                
                CircleImage(image: Image(landmark.imageName))
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
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
            
    }
    
    private func titleView() -> some View {
        let titleText = Text(landmark.name)
            .font(.title)
        
        let subTitleView = HStack {
            Text(landmark.park)
            Spacer() // 가운데 여백
            Text(landmark.state)
        }
            .font(.subheadline)
            .foregroundColor(.secondary)
        
        let result = TupleView((titleText, subTitleView))
        return result
    }
    
    private func descriptionView() -> some View {
        let descriptionTitleText = Text("About \(landmark.name)")
            .font(.title2)
        
        let descriptionText = Text(landmark.description)
        
        let result = TupleView((descriptionTitleText, descriptionText))
        return result
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: LocalStorageService.landmarks[1])
    }
}
