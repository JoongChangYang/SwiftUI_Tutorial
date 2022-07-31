//
//  ContentViewModel.swift
//  Playground
//
//  Created by 양중창 on 2022/07/20.
//

import Foundation
import Combine

final class JCSubscription: Subscription {
    
    private let cancellable: Cancellable
    
    init(_ cancel: @escaping () -> Void) {
        self.cancellable = AnyCancellable(cancel)
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        self.cancellable.cancel()
    }
}

final class JCSubscriber<Input, Failure: Error>: Subscriber {
    
    var subscription: Subscription?
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        
    }
    
}

struct User: Decodable {
    var firstName = ""
    var lastName = ""
    let email: String
    let id: Int
    let bio: String
    
    
    static var empty: User {
        return User(email: "none", id: -1)
    }
    
    enum CodingKeys: String, CodingKey {
        case email
        case id
        case bio
    }
    
    init(email: String, id: Int, bio: String = "") {
        self.email = email
        self.id = id
        self.bio = bio
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = (try? container.decode(String.self, forKey: .email)) ?? ""
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? -2
        self.bio = (try? container.decode(String.self, forKey: .bio)) ?? ""
    }
}

final class ContentViewModel: ObservableObject {
    @Published var user = User.empty
    private var bag = Set<AnyCancellable>()
    
    func test() {
        let url = URL(string: "https://api.github.com/users/didwndckd")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .replaceError(with: User(email: "error", id: -1))
            .receive(on: DispatchQueue.main)
            .assign(to: \.user, on: self)
            .store(in: &self.bag)
    }
}
