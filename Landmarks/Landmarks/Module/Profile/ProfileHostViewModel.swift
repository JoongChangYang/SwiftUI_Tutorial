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
        let profile = Profile.default
        let hike = LocalStorageService.hikes[0]
    }
    
    enum Action {}
    func action(_ action: Action) {}
}
