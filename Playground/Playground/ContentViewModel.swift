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
}
