//
//  LoginView.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Login")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension LoginView {
    @ViewBuilder
    private var contentView: some View {
        VStack {
            TextField("Enter ID", text: $viewModel.state.id)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("Enter Password", text: $viewModel.state.password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Login") {
                viewModel.action(.login)
            }
            
            NavigationLink(isActive: $viewModel.moveTo.navigationPresent,
                           destination: { self.destinationView },
                           label: { EmptyView() })
            
            Spacer()
        }
    }
}

extension LoginView {
    @ViewBuilder
    private var destinationView: some View {
        if let moveTo = self.viewModel.moveTo {
            self.destinationView(moveTo)
        }
    }
    
    private func destinationView(_ moveTo: LoginViewModel.MoveTo) -> some View {
        switch moveTo {
        case .detail(let detailViewModel):
            return DetailView(viewModel: detailViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
