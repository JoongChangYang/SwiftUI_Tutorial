//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            self.imageView
            self.informationView
            Spacer()
            self.favoriteView
        }
        .padding(.vertical, 4)
    }
}

extension LandmarkRow {
    @ViewBuilder
    private var imageView: some View {
        Image(self.landmark.imageName)
            .resizable() // 이미지를 뷰에 맞게 리사이징
            .frame(width: 50, height: 50)
            .cornerRadius(5)
    }
    
    @ViewBuilder
    private var informationView: some View {
        VStack(alignment: .leading) {
            Text(self.landmark.name)
                .bold()
            #if !os(watchOS)
            Text(self.landmark.park)
                .font(.caption)
                .foregroundColor(.secondary)
            #endif
        }
    }
    
    @ViewBuilder
    private var favoriteView: some View {
        if self.landmark.isFavorite {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: LocalStorageService.landmarks[0])
                .previewLayout(.fixed(width: 300, height: 70))
            
            LandmarkRow(landmark: LocalStorageService.landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
            
            LandmarkRow(landmark: LocalStorageService.landmarks[2])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
