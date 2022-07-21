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

struct User {
    var firstName = ""
    var lastName = ""
}

final class ContentViewModel: ObservableObject {
    @Published var user = User()
    
    private var bag = Set<AnyCancellable>()
    let syncQueue = DispatchQueue.global(qos: .background)
    func test() {
        let subject = CurrentValueSubject<String, Never>("시작")
        let subscriber = subject.handleEvents(
            receiveSubscription: { subscription in
                print("receiveSubscription")
            }, receiveOutput: { output in
                print("receiveOutput: \(output)")
            }, receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("failure", error.localizedDescription)
                }
            },
            receiveCancel: {
                print("receiveCancel")
            }, receiveRequest: { demand in
                print("receiveRequest: \(demand)")
            })
            .sink(receiveCompletion: { completion in
                print("in sink")
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("failure", error.localizedDescription)
                }
            }, receiveValue: { value in
                print("in sink")
                print(value)
            })
            
        
        subject.send("1")
        subject.send("2")
        subscriber.cancel()
        
    }
}
