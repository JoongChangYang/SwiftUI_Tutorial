//
//  ProfileEditorView.swift
//  Landmarks
//
//  Created by YJC on 2022/09/25.
//

import SwiftUI

struct ProfileEditorView: View {
    @Binding
    var profile: Profile
    
    var body: some View {
        List {
            self.userNameView
            self.notificationSwitchView
            self.seasonalPhotoView
            self.datePicker
        }
    }
}

extension ProfileEditorView {
    @ViewBuilder
    private var userNameView: some View {
        HStack {
            Text("username").bold()
            Divider()
            TextField("Username", text: $profile.userName)
        }
    }
    
    @ViewBuilder
    private var notificationSwitchView: some View {
        Toggle(isOn: $profile.prefersNotifications,
               label: { Text("Enable Notifications").bold() })
    }
    
    @ViewBuilder
    private var seasonalPhotoView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Seasonal Photo").bold()
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    @ViewBuilder
    private var datePicker: some View {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: self.profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: self.profile.goalDate)!
        let range = min...max
        
        DatePicker(selection: self.$profile.goalDate,
                   in: range,
                   displayedComponents: .date,
                   label: { Text("Goal Date").bold() })
    }
}

struct ProfileEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditorView(profile: .constant(.default))
    }
}
