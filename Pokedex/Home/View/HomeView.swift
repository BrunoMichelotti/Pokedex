//
//  HomeView.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 30/08/22.
//

import UIKit

class HomeView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "\(PokemonTableViewCell.self)")
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
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
}

extension HomeView: ViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(self.tableView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([        
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configElements() {
        //
    }
    
    
}
