//
//  PageView.swift
//  Landmarks
//
//  Created by YJC on 2022/09/28.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: self.pages, currentPage: self.$currentPage)
            PageControl(numberOfPages: self.pages.count, currentPage: self.$currentPage)
                .frame(width: CGFloat(self.pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: LandmarkDataService.shared.features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
