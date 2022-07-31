//
//  AlertMemoryLeakTestFirstView.swift
//  Playground
//
//  Created by YJC on 2022/07/31.
//

import SwiftUI

struct AlertMemoryLeakTestFirstView: View {
    @ObservedObject private var viewModel = AlertMemoryLeakTestFirstViewModel()
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("current count : \(self.count)")
                    .padding()
                
                Button("addCount", action: {
                    self.count += 1
                })
                
//                NavigationLink("link - \(self.count)", destination: {
//                    AlertMemoryLeakTestSecondView(tag: 1)
//                })
//                .padding()
                
                Button("button", action: { [weak viewModel] in
                    viewModel?.push()
                })
                .padding()
                
                self.emptyNavigationLink(.second, destination: {
                    AlertMemoryLeakTestSecondView(tag: 2)
                })
                
            }
            .doSomething {
                print("updated")
            }
        }
    }
}

extension AlertMemoryLeakTestFirstView {
    private func emptyNavigationLink<Destination: View>(_ moveTo: AlertMemoryLeakTestFirstViewModel.MoveTo,
                                                        @ViewBuilder destination: @escaping () -> Destination) -> some View {
        return NavigationLink<EmptyView, Destination>(tag: moveTo,
                                                      selection: self.$viewModel.moveTo,
                                                      destination: destination,
                                                      label: { EmptyView() })
    }
}

struct AlertMemoryLeakTestFirstView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMemoryLeakTestFirstView()
    }
}
