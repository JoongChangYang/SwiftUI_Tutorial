//
//  LandmarkList.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import SwiftUI

struct LandmarkList: View {
    
    private var landmarks = LocalStorageService.landmarks
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
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
