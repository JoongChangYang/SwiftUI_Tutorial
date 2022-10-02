//
//  LandmarkDetailView.swift
//  WatchLandmarks Watch App
//
//  Created by YJC on 2022/10/03.
//

import SwiftUI

struct LandmarkDetailView: View {
    @ObservedObject
    private var viewModel: LandmarkDetailViewModel
    
    init(viewModel: LandmarkDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(viewModel: .init(landmark: LocalStorageService.landmarks[0]))
    }
}
