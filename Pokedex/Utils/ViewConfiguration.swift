//
//  ViewConfiguration.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 31/08/22.
//

import UIKit

protocol ViewConfiguration : AnyObject {
    func buildViewHierarchy()
    func makeConstraints()
    func configElements()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        makeConstraints()
        configElements()
    }
    
}
