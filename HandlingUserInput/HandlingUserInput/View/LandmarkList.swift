//
//  LandmarkList.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    
    private var filteredLandmarks: [Landmark] {
        return LocalStorageService.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Faivotrites only")
                })
                
                // 반복 리스트 만드는 객체 인듯
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro(12.9-inch)"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(.init(rawValue: deviceName))
        }
    }
}
