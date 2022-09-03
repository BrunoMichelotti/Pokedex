//
//  ViewController.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 29/08/22.
//

import UIKit
import AlamofireImage

class HomeViewController: UIViewController {
    
    var screen: HomeView?
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.screen = HomeView()
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        self.viewModel.setDelegate(delegate: self)
        viewModel.fetchData()
    }


}

extension HomeViewController : HomeViewModelDelegate {
   
    func success() {
        screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: "API fora do ar", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokemon = viewModel.pokemonList?[indexPath.row]  else { return }
        let infoViewModel = PokemonInfoViewModel(pokemon: pokemon)
        let vc = PokemonInfoViewController(viewModel: infoViewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(PokemonTableViewCell.self)", for: indexPath) as? PokemonTableViewCell,
              let pokemon = viewModel.pokemonList?[indexPath.row],
              let url = URL(string: pokemon.url ?? "") else { return UITableViewCell() }
        
        cell.setup(description: pokemon.name ?? "")
        viewModel.getPokemonImageUrl(url: url) { imageURL in
        cell.pokemonImageView.af.setImage(withURL: imageURL)}
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension HomeViewController {
    
    func setHeader(){
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "PokedexLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = imageView
    }
}
