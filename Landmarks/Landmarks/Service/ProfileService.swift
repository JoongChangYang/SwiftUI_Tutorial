//
//  ProfileService.swift
//  Landmarks
//
//  Created by YJC on 2022/09/25.
//

import Foundation
import Combine

final class ProfileService {
    static let shared = ProfileService()
    private init() {}
    
    private let profile = CurrentValueSubject<Profile, Never>(Profile.default)
}

extension ProfileService {
    var profilePublisher: AnyPublisher<Profile, Never> {
        return self.profile.eraseToAnyPublisher()
    }
    
    var currentProfile: Profile {
        return self.profile.value
    }
    
    func updateProfile(_ profile: Profile) {
        self.profile.send(profile)
    }
}
