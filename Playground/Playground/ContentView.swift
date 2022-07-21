//
//  ContentView.swift
//  Playground
//
//  Created by 양중창 on 2022/07/20.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        
    }
}

struct ContentView: View {
    
    @ObservedObject private var viewModel = ContentViewModel()
    @FocusState private var firstNameFocused: Bool
    @FocusState private var lastNameFocused: Bool
    
    var body: some View {
        VStack {
            Text("당신의 이름은 \(self.viewModel.user.firstName)\(self.viewModel.user.lastName) 입니다")
                .font(.title)
                .fontWeight(.bold)
                .padding(30)
            
            List {
                Section(content: {
                    TextField("성", text: self.$viewModel.user.firstName)
                        .focused(self.$firstNameFocused)
                        .onSubmit {
                            lastNameFocused = true
                        }
                        .submitLabel(.next)
                    
                    TextField("이름", text: self.$viewModel.user.lastName)
                        .focused(self.$lastNameFocused)
                        .onSubmit {
                            lastNameFocused = false
                        }
                        .submitLabel(.done)
                    
                    Button("Submit", action: { self.viewModel.test() })
                },
                        header: {
                    Text("이름을 입력하세요")
                        .font(.headline)
                },
                        footer: {
                    Text("Footer")
                        .font(.footnote)
                })
            }
        }
        
        // end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
