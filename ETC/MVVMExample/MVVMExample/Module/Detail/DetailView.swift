//
//  DetailView.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            Text("id: \(viewModel.state.id)")
                .padding()
            
            Text("password: \(viewModel.state.password)")
                .padding()
            
            Button("dismiss") {
                viewModel.action(.dismiss)
            }
            .padding()
            
            Button("navi") {
                self.viewModel.action(.navi)
            }
            .padding()
            
            Button("popover") {
                self.viewModel.action(.popover)
            }
            .padding()
            
            Button("sheet") {
                self.viewModel.action(.sheet)
            }
            .padding()
            
            NavigationLink(isActive: self.$viewModel.moveTo.navigationPresent,
                           destination: { self.destinationView },
                           label: { EmptyView() })
            Spacer()
        }
        .navigationTitle("Detail")
        .alert(model: $viewModel.state.alertModel)
        .popover(isPresented: self.$viewModel.moveTo.popoverPresent, content: {
            self.destinationView
        })
        .sheet(isPresented: $viewModel.moveTo.sheetPresent, content: {
            self.destinationView
        })
    }
}

extension DetailView {
    func log(_ message: String) -> some View {
        return EmptyView()
    }
    
    @ViewBuilder
    private var destinationView: some View {
        if let moveTo = self.viewModel.moveTo {
            self.destinationView(moveTo)
        }
    }
    
    private func destinationView(_ moveTo: DetailViewModel.MoveTo) -> some View {
        switch moveTo {
        case .navi(let vm):
            print("navi")
            return PresentTestView(viewModel: vm)
        case .popover(let vm):
            print("popover")
            return PresentTestView(viewModel: vm)
        case .sheet(let vm):
            print("sheet")
            return PresentTestView(viewModel: vm)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: .init(source: nil, id: "id", password: "password"))
    }
}
