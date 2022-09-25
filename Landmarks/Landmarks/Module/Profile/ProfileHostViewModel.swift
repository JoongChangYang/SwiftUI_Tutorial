//
//  ProfileHostViewModel.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import Foundation

final class ProfileHostViewModel: ViewModel, ObservableObject {
    
    @Published
    var state = State()
}

extension ProfileHostViewModel {
    struct State {
        var profile = ProfileService.shared.currentProfile
        let hike = LocalStorageService.hikes[0]
    }
    
    enum Action {
        case editingCancel
        case fetchProfile
        case updateProfile
    }
    
    func action(_ action: Action) {
        switch action {
        case .editingCancel:
            self.editingCancel()
        case .fetchProfile:
            self.fetchProfile()
        case .updateProfile:
            self.updateProfile()
        }
    }
}

extension ProfileHostViewModel {
    private func editingCancel() {
        self.state.profile = ProfileService.shared.currentProfile
    }
    
    private func fetchProfile() {
        self.state.profile = ProfileService.shared.currentProfile
    }
    
    private func updateProfile() {
        ProfileService.shared.updateProfile(self.state.profile)
    }
}
