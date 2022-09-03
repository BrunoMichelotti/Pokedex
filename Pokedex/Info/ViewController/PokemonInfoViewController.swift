//
//  PokemonInfoViewController.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 01/09/22.
//

import UIKit

class PokemonInfoViewController: UIViewController {
    
    var screen: PokemonInfoView?
    var viewModel: PokemonInfoViewModel
    
    init(viewModel: PokemonInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.screen = PokemonInfoView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        fetchData()
    }
    
}
extension PokemonInfoViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.pokemon.info?.stats?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(PokemonInfoTableViewCell.self)", for: indexPath) as? PokemonInfoTableViewCell,
              let statName = viewModel.pokemon.info?.stats?[indexPath.row].stat?.name,
              let statValue = viewModel.pokemon.info?.stats?[indexPath.row].baseStat else { return UITableViewCell() }
        
        cell.setup(description: statName, value: "\(statValue)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PokemonInfoViewController {
    
    func fetchData() {
        viewModel.getPokemonDadosUrl{
            self.screen?.contentTableView.reloadData()
        }
        guard let url = URL(string: viewModel.pokemon.url ?? "")  else { return }
        viewModel.getPokemonImageUrl(url: url) { imageURL in
        self.screen?.pokemonImageView.af.setImage(withURL: imageURL)}
    }
}


