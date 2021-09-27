//
//  LandmarkListRowView.swift
//  SwiftUIExample
//
//  Created by 양중창 on 2021/09/24.
//

import SwiftUI

struct LandmarkListRowView: View {
    
    var landMark: Landmark
    
    var body: some View {
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)

            Text(landMark.name)
            
            Spacer()
        }
    }
}

struct LandmarkListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkListRowView(landMark: landMarks[0])
            LandmarkListRowView(landMark: landMarks[1])
            LandmarkListRowView(landMark: landMarks[2])
            LandmarkListRowView(landMark: landMarks[2])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
        
}
