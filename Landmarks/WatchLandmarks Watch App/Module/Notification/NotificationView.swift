//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by YJC on 2022/10/05.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            self.imageView
            self.titleView
            Divider()
            self.messageView
        }
        .lineLimit(0)
    }
}

extension NotificationView {
    @ViewBuilder
    private var imageView: some View {
        if let landmark = self.landmark {
            CircleImage(image: Image(landmark.imageName).resizable())
                .scaledToFit()
        }
    }
    
    @ViewBuilder
    private var titleView: some View {
        Text(self.title ?? "Unknown Landmark")
            .font(.headline)
    }
    
    @ViewBuilder
    private var messageView: some View {
        Text(self.message ?? "You are within 5 miles of one of your favorite landmarks.")
            .font(.caption)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: LocalStorageService.landmarks[0])
        }
    }
}
