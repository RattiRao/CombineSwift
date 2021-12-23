//
//  ViewController.swift
//  CombineSwift_UIKit
//
//  Created by Ratti on 23/12/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSwitch: UISwitch!
    @IBOutlet weak var btnEnableDisable: UIButton!
    
    @Published var publisherIsEnabled: Bool = false
    var subscriber: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subscriber = $publisherIsEnabled.receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: btnEnableDisable)
    }

    @IBAction func btnSwitchAction(_ sender: UISwitch) {
        publisherIsEnabled = sender.isOn
    }

}

