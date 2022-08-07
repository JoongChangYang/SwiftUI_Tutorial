//
//  PresentTestView.swift
//  MVVMExample
//
//  Created by YJC on 2022/08/01.
//

import SwiftUI

struct PresentTestView: View {
    
    @ObservedObject private var viewModel: PresentTestViewModel
    init(viewModel: PresentTestViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(self.viewModel.state.title)
                .padding()
            
            Button("dismiss") {
                viewModel.action(.dismiss)
            }
            .padding()
        }
    }
}

struct PresentTestView_Previews: PreviewProvider {
    static var previews: some View {
        PresentTestView(viewModel: PresentTestViewModel(title: "TEST"))
    }
}
