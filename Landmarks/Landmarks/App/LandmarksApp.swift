//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 양중창 on 2022/07/07.
//

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(viewModel: MainTabViewModel())
        }
    }
}
