//
//  ViewController.swift
//  CombineAPI
//
//  Created by Ratti on 21/12/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    var cancellables: Set<AnyCancellable> = Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Network.shared.getDummyData(url: "http://echo.jsontest.com/title/ipsum/content/blah", type: DummyData.self)
            .sink { completion in
                print(completion)
            } receiveValue: { value in
                print("Value from api: \(value)")
            }
            .store(in: &cancellables)
        
    }


}

