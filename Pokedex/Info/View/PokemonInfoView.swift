//
//  PokemonInfoView.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 01/09/22.
//

import UIKit

class PokemonInfoView: UIView {

    lazy var pokemonImageView: UIImageView = {
        var pokemonImageView = UIImageView()
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.contentMode = .scaleAspectFill
        pokemonImageView.backgroundColor = .black
        pokemonImageView.clipsToBounds = true
       
        return pokemonImageView
    }()
    
    lazy var titleStatusLabel: UILabel = {
        var baseStatusLabel = UILabel()
        baseStatusLabel.text = "Base Status"
        baseStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        baseStatusLabel.textColor = .white
        baseStatusLabel.textAlignment = .center
        baseStatusLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return baseStatusLabel
    }()
    
    lazy var contentTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        
        tableView.register(PokemonInfoTableViewCell.self, forCellReuseIdentifier: "\(PokemonInfoTableViewCell.self)")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDelegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource ){
        self.contentTableView.delegate = delegate
        self.contentTableView.dataSource = dataSource
    }
    
}

extension PokemonInfoView : ViewConfiguration {
    func buildViewHierarchy() {
        self.addSubview(self.pokemonImageView)
        self.addSubview(self.titleStatusLabel)
        self.addSubview(self.contentTableView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: self.topAnchor),
            pokemonImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pokemonImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonImageView.bottomAnchor.constraint(equalTo: titleStatusLabel.topAnchor),
            
            titleStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentTableView.topAnchor.constraint(equalTo: titleStatusLabel.bottomAnchor),
            contentTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            contentTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            
            pokemonImageView.heightAnchor.constraint(equalToConstant: 400),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 400)
        ])
       
    }
    
    func configElements() {
        self.backgroundColor = .black
    }
    
    
}
