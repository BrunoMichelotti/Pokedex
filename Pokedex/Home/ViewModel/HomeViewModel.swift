//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 29/08/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class HomeViewModel {
    
    var pokemonList: [PokemonEntry]?
    
    private let service = PokemonService()
    private weak var delegate: HomeViewModelDelegate?
    
    func setDelegate(delegate: HomeViewModelDelegate?){
        self.delegate = delegate
    }
    
    func fetchData() {
        service.getPokemon { success, error in
            if let success = success{
                self.pokemonList = success.results
                self.delegate?.success()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
    
    func getPokemonImageUrl(url : URL, completion: @escaping((URL) -> Void)) {
        service.getPokemonSelected(url: url) { result, failure in
            if let frontDefault = result?.sprites?.front_default,
               let imageURL = URL(string: frontDefault) {
                completion(imageURL)
            }
        }
    }
}
