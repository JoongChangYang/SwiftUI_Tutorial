//
//  LandmarkRow.swift
//  BuildingListsAndNavigation
//
//  Created by 양중창 on 2022/07/11.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable() // 이미지를 뷰에 맞게 리사이징
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[2])
            LandmarkRow(landmark: landmarks[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
