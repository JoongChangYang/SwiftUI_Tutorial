//
//  ContentView.swift
//  Landmarks
//
//  Created by YJC on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView(viewModel: MainTabViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
