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
    
    @Environment(\.editMode)
    private var editMode
    
    init(viewModel: ProfileHostViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            self.headerView
            
            if self.editMode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: self.viewModel.state.profile)
            } else {
                ProfileEditorView(profile: self.$viewModel.state.profile)
                    .onAppear {
                        self.viewModel.action(.fetchProfile)
                    }
                    .onDisappear {
                        self.viewModel.action(.updateProfile)
                    }
            }
            
        }
        .padding()
    }
}

extension ProfileHostView {
    @ViewBuilder
    private var headerView: some View {
        HStack {
            if self.editMode?.wrappedValue == .active {
                Button("cancel", role: .cancel) {
                    self.viewModel.action(.editingCancel)
                    self.editMode?.animation().wrappedValue = .inactive
                }
            }
            
            Spacer()
            EditButton()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHostView(viewModel: .init())
    }
}
