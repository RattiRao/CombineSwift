//
//  Network.swift
//  CombineAPI
//
//  Created by Ratti on 21/12/21.
//

import Foundation
import Combine

enum MyError: Error{
    case unusualError
}

struct DummyData: Codable{
    let title: String?
    let content: String?
}

class Network {
    static let shared: Network = Network()
    @Published var viewModelInfo: ViewModel?
    var cancellables: Set<AnyCancellable> = Set()
    
    func getDummyData<T:Codable>(url: String, type: T.Type) -> Future<T, MyError>{
        return Future<T, MyError> {promise in
            guard let url = URL.init(string: url) else { return promise(.failure(.unusualError)) }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data: Data, response: URLResponse) -> Data in
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    print(completion)
                } receiveValue: { value in
                    self.viewModelInfo = ViewModel.init(model: value as! DummyData)
                    promise(.success(value))
                }
                .store(in: &self.cancellables)
        }
    }
}
