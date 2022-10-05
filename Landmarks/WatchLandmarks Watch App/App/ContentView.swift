//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by YJC on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = LandmarkListViewModel()
        LandmarkListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
