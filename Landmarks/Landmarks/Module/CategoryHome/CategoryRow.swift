//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    let items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            self.titleView
            
            ScrollView(.horizontal, showsIndicators: false) {
                self.bodyView
            }
            .frame(height: 185)
        }
    }
}

extension CategoryRow {
    @ViewBuilder
    private var titleView: some View {
        Text(categoryName)
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
    }
    
    @ViewBuilder
    private var bodyView: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(self.items) { landmark in
                self.categoryItem(landmark: landmark)
            }
        }
    }
    
    @ViewBuilder
    private func categoryItem(landmark: Landmark) -> some View {
        NavigationLink {
            let viewModel = LandmarkDetailViewModel(landmark: landmark)
            LandmarkDetailView(viewModel: viewModel)
        } label: {
            CategoryItem(landmark: landmark)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = LocalStorageService.landmarks
        let landmark = landmarks[0]
        CategoryRow(
            categoryName: landmark.category.rawValue,
            items: Array(landmarks.prefix(3))
        )
    }
}
