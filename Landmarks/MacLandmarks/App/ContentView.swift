//
//  ContentView.swift
//  MacLandmarks
//
//  Created by YJC on 2022/10/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = LandmarkListViewModel()
        LandmarkListView(viewModel: viewModel)
            .frame(minWidth: 700, minHeight: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
