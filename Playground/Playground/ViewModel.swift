//
//  ViewModel.swift
//  Playground
//
//  Created by 양중창 on 2022/07/20.
//

import Foundation

struct Person {
    var name: String
    var birthday: Date
}

final class ViewModel: ObservableObject {
    @Published var jungchang = Person(name: "중창", birthday: Date())
    
    var name: String {
        return jungchang.name
    }
    
    var age: String {
        return "27"
    }
    
    func changeName(_ name: String) {
        jungchang.name = name
    }
    
}
