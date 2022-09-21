//
//  MainTabView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/09/21.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject
    private var viewModel: MainTabViewModel
    
    init(viewModel: MainTabViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView(selection: self.$viewModel.state.tab) {
            self.categoryView
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(MainTabViewModel.Tab.featured)
            
            self.listView
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(MainTabViewModel.Tab.list)
        }
    }
}

extension MainTabView {
    @ViewBuilder
    private var categoryView: some View {
        CategoryHomeView(viewModel: self.viewModel.category)
    }
    
    @ViewBuilder
    private var listView: some View {
        LandmarkListView(viewModel: self.viewModel.list)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainTabViewModel()
        MainTabView(viewModel: viewModel)
    }
}
