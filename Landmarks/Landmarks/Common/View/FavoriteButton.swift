//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(
            action: {
                self.isSet.toggle()
            }, label: {
                Label("Toggle Favorite", systemImage: self.isSet ? "star.fill": "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(self.isSet ? .yellow: .gray)
            })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
