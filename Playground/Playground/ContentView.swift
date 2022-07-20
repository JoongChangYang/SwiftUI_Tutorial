//
//  ContentView.swift
//  Playground
//
//  Created by 양중창 on 2022/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.name)
                .padding()
            
            Text(viewModel.age)
                .padding()
            
            Button("이름변경") {
                viewModel.changeName("포뇨")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
