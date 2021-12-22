import UIKit
import Combine

enum PublisherError: Error{
    case usualError
}
let publisher = PassthroughSubject<Int, PublisherError>()
let subscriber = publisher
    .filter{$0 > 25}
    .sink { completion in
        switch completion{
        case .failure(_):
            print("Failed")
        case .finished:
            print("Finished")
        }
    } receiveValue: { value in
        print("Weather temperature: \(value) degrees")
    }

let newSubscriber = publisher.handleEvents { _ in
    print("New Subscriber")
} receiveOutput: { _ in
    print("Received Output")
} receiveCompletion: { _ in
    
} receiveCancel: {
    
} receiveRequest: { _ in
    
}

newSubscriber
    .sink { _ in
        
    } receiveValue: { _ in
        print("Received Value")
    }


/*publisher.send(10)
publisher.send(30)
publisher.send(20)
publisher.send(28)

publisher.send(completion: Subscribers.Completion<PublisherError>.failure(.usualError))*/

let justPublisher = Just(5)
let justSubscriber = justPublisher
    .filter{$0 <= 5}
    .sink { completion in
        print(completion)
    } receiveValue: { value in
        print(value)
    }

