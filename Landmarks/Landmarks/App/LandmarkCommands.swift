//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by YJC on 2022/10/10.
//

import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(self.selectedLandmark?.isFavorite == true ? "Remove": "Mark") as Favorite") {
                self.selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(self.selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
