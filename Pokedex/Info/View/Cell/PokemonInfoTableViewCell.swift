//
//  PokemonInfoTableViewCell.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 02/09/22.
//

import UIKit

class PokemonInfoTableViewCell: UITableViewCell {

    lazy var statusLabel: UILabel = {
        var statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = .white
        statusLabel.font = UIFont.systemFont(ofSize: 18)
        return statusLabel
    }()
    
    lazy var valueLabel: UILabel = {
        var valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textColor = .white
        valueLabel.textAlignment = .right
        valueLabel.font = UIFont.systemFont(ofSize: 18)
        return valueLabel
    }()
    
    lazy var container: UIStackView = {
        var container = UIStackView(arrangedSubviews: [statusLabel,valueLabel])
        container.translatesAutoresizingMaskIntoConstraints = false
        container.distribution = .fillEqually
        container.axis = .horizontal
        return container
    }()

    func setup(description: String, value: String){
        self.statusLabel.text = description
        self.valueLabel.text = value
        
        self.setupViewConfiguration()
    }
}

extension PokemonInfoTableViewCell : ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubview(container)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configElements() {
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
    
    
}
