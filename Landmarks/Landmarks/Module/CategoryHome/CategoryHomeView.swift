//
//  CategoryHomeView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import SwiftUI

struct CategoryHomeView: View {
    @ObservedObject
    private var viewModel: CategoryHomeViewModel
    
    init(viewModel: CategoryHomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                self.featuredView
                
                ForEach(self.viewModel.state.categories.keys.sorted(), id: \.self) { key in
                    self.categoryRow(key: key)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
        }
    }
}

extension CategoryHomeView {
    @ViewBuilder
    private var featuredView: some View {
        if let landmark = self.viewModel.featuredLandmark {
            Image(landmark.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .listRowInsets(EdgeInsets())
        }
    }
    
    @ViewBuilder
    private func categoryRow(key: String) -> some View {
        let landmarkItems = self.viewModel.landmarkItems(key: key)
        CategoryRow(categoryName: key, items: landmarkItems)
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CategoryHomeViewModel()
        CategoryHomeView(viewModel: viewModel)
    }
}
