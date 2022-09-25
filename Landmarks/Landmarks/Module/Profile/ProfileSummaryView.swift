//
//  ProfileSummaryView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import SwiftUI

struct ProfileSummaryView: View {
    let profile: Profile
    let hike = LocalStorageService.hikes[0]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                self.headerView
                Divider()
                self.badgeListView
                Divider()
                self.hikeView
            }
        }
    }
}

extension ProfileSummaryView {
    @ViewBuilder
    private var headerView: some View {
        Text(self.profile.userName)
            .bold()
            .font(.title)
        
        Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off")")
        Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
        Text("Goal Date: ") + Text(self.profile.goalDate, style: .date)
    }
    
    @ViewBuilder
    private var badgeListView: some View {
        VStack(alignment: .leading) {
            Text("Completed Badges")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    HikeBadgeView(name: "First Hike")
                    HikeBadgeView(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadgeView(name: "Tenth Hike")
                        .grayscale(0.5)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding(.bottom)
            }
        }
    }
    
    @ViewBuilder
    private var hikeView: some View {
        VStack(alignment: .leading) {
            Text("Recent Hikes")
                .font(.headline)
            
            let viewModel = HikeViewModel(hike: self.hike)
            HikeView(viewModel: viewModel)
        }
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: .default)
    }
}
