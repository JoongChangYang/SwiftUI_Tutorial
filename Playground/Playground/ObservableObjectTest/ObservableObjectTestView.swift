//
//  ObservableObjectTestView.swift
//  Playground
//
//  Created by YJC on 2022/07/30.
//

import SwiftUI

struct ObservableObjectTestView: View {
    
    @StateObject private var viewModel: ObservableObjectTestViewModel
    private let count: Int
    
    init(count: Int) {
        let viewModel = ObservableObjectTestViewModel(count: count)
        self._viewModel = StateObject<ObservableObjectTestViewModel>(wrappedValue: viewModel)
        self.count = count
    }
    
    var body: some View {
        self.contentView(content: {
            VStack { [weak viewModel] in
                Text("\(viewModel?.count ?? 0)")
                    .padding()
                
                Button("addCount", action: {
                    viewModel?.addCount()
                })
                .padding()
                
                Button("alert", action: {
                    viewModel?.showAlert()
                })
                .padding()
                
                NavigationLink(destination: {
                    ObservableObjectTestView(count: self.count + 1)
                }, label: {
                    Text("push")
                })
                .padding()
            }
        })
        .doSomething {
            print("updated: \(self.count)")
        }
        
//        .alert(model: self.$viewModel.alert)
    }
}

extension ObservableObjectTestView {
    
    @ViewBuilder
    private func contentView<C: View>(@ViewBuilder content: () -> C) -> some View {
        if self.count == 0 {
             NavigationView {
                content()
            }
        } else {
            content()
        }
    }
}

struct ObservableObjectTestView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectTestView(count: 0)
    }
}

extension View {
    func doSomething(_ something: @escaping () -> Void) -> some View {
        something()
        return self
    }
}
