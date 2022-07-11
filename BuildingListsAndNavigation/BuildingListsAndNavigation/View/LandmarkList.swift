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
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
