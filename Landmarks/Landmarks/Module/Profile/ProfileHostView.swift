//
//  ProfileHostView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import SwiftUI

struct ProfileHostView: View {
    @ObservedObject
    private var viewModel: ProfileHostViewModel
    
    init(viewModel: ProfileHostViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummaryView(profile: self.viewModel.state.profile)
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHostView(viewModel: .init())
    }
}
