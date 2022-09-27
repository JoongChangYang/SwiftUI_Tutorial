//
//  FeatureCard.swift
//  Landmarks
//
//  Created by YJC on 2022/09/27.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        self.image?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: self.landmark)
            }
    }
}

extension FeatureCard {
    private var image: Image? {
        guard let imageName = self.landmark.featureImageName else { return nil }
        return Image(imageName)
    }
}

extension FeatureCard {
    struct TextOverlay: View {
        var landmark: Landmark
        
        private var gradient: LinearGradient {
            return .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                                   startPoint: .bottom,
                                   endPoint: .center)
        }
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                self.gradient
                VStack(alignment: .leading) {
                    Text(self.landmark.name)
                        .font(.title)
                        .bold()
                    
                    Text(self.landmark.park)
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
    
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: LocalStorageService.landmarks[0])
    }
}
