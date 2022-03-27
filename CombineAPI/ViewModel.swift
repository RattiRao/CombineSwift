//
//  ViewModel.swift
//  CombineAPI
//
//  Created by Ratti on 27/03/22.
//

import Foundation

class ViewModel {
    let title: String?
    let content: String?
    
    init(model: DummyData) {
        self.title = model.title
        self.content = model.content
    }
}
