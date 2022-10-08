//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by YJC on 2022/08/07.
//

import SwiftUI

struct LandmarkListView: View {
    @ObservedObject
    private var viewModel: LandmarkListViewModel
    
    init(viewModel: LandmarkListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                #if os(watchOS)
                self.favoriteOnlyToggle
                #endif
                ForEach(self.viewModel.filteredLandmarks, content: { landmark in
                    NavigationLink(destination: {
                        self.detailView(landmark)
                    }, label: {
                        LandmarkRow(landmark: landmark)
                    })
                    
                })
            }
            .navigationTitle(self.viewModel.title)
            #if os(macOS)
            .frame(minWidth: 300)
            #endif
            .toolbar {
                ToolbarItem { self.filterCategoryMenuButton }
            }
            
            #if os(macOS)
            Text("Select a Landmark")
            #endif
        }
    }
}

extension LandmarkListView {
    @ViewBuilder
    private func detailView(_ landmrk: Landmark) -> some View {
        let viewModel = self.viewModel.detailViewModel(landmark: landmrk)
        LandmarkDetailView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private var filterCategoryMenuButton: some View {
        #if !os(watchOS)
        Menu {
            self.categoryPicker
            self.favoriteOnlyToggle
        } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
        }
        #endif
    }
    
    @ViewBuilder
    private var categoryPicker: some View {
        Picker("Category", selection: self.$viewModel.state.filter) {
            ForEach(LandmarkListViewModel.FilterCategory.allCases) { category in
                Text(category.rawValue).tag(category)
            }
        }
        .pickerStyle(.inline)
    }
    
    @ViewBuilder
    private var favoriteOnlyToggle: some View {
        Toggle(isOn: self.$viewModel.state.showFavoritesOnly,
               label: {
            Text("Faivotrites only")
        })
    }
    
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(viewModel: LandmarkListViewModel())
    }
}
