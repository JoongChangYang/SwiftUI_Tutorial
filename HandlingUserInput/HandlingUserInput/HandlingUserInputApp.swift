//
//  HandlingUserInputApp.swift
//  HandlingUserInput
//
//  Created by 양중창 on 2022/07/12.
//

import SwiftUI

@main
struct HandlingUserInputApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
