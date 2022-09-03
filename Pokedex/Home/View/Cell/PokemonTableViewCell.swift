//
//  SectionView.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 30/08/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setup(description: String){
        
        self.setupViewConfiguration()
        self.descriptionLabel.text = description
        self.backgroundColor = .black
    }
    
}

extension PokemonTableViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(pokemonImageView)
        self.addSubview(descriptionLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: pokemonImageView.leadingAnchor),
            
            self.pokemonImageView.heightAnchor.constraint(equalToConstant: 60),
            self.pokemonImageView.widthAnchor.constraint(equalToConstant: 60),
            self.pokemonImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.pokemonImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
    }
    
    func configElements() {
        self.selectionStyle = .none
    }
    
}
