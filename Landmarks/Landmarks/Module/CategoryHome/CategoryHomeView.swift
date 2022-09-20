//
//  CategoryHomeView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/20.
//

import SwiftUI

struct CategoryHomeView: View {
    @ObservedObject private var viewModel: CategoryHomeViewModel
    
    init(viewModel: CategoryHomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CategoryHomeViewModel()
        CategoryHomeView(viewModel: viewModel)
    }
}
