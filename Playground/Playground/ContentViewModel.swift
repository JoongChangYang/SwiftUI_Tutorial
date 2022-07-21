//
//  ContentViewModel.swift
//  Playground
//
//  Created by 양중창 on 2022/07/20.
//

import Foundation
import Combine

struct User {
    var firstName = ""
    var lastName = ""
}

final class ContentViewModel: ObservableObject {
    @Published var user = User()
    
    func test() {
        let publisher = Just("YJC")
        
        let subscriber = publisher.sink(receiveCompletion: { result in
            switch result {
            case .finished:
                print("receiveCompletion finished")
            case .failure(let error):
                print("receiveCompletion", error.localizedDescription)
            }
        }, receiveValue: { value in
            print("receiveValue", value)
        })
        
    }
}
