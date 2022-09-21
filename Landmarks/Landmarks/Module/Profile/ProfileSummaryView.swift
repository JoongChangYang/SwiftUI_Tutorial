//
//  ProfileSummaryView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import SwiftUI

struct ProfileSummaryView: View {
    let profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.userName)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off")")
                Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
        }
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: .default)
    }
}
