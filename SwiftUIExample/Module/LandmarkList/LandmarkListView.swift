//
//  LandmarkListView.swift
//  SwiftUIExample
//
//  Created by 양중창 on 2021/09/24.
//

import SwiftUI

struct LandmarkListView: View {
    
    var body: some View {
        List(landMarks, id: \.id) { landmark in
            LandmarkListRowView(landMark: landmark)
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
