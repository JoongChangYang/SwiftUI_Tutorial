//
//  LandmarkDetail.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/12.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        return modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
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
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    
                    Divider() // 구분선
                    
                    HStack {
                        Text(landmark.park)
                        Spacer() // 가운데 여백
                        Text(landmark.state)
                    }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    
                    Text(landmark.description)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
            
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
