//
//  PokemonInfoViewModel.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 01/09/22.
//

import UIKit

class PokemonInfoViewModel {

    var pokemon: PokemonEntry
    var service = PokemonService()
      
    init(pokemon: PokemonEntry) {
        self.pokemon = pokemon
    }
    
    func getPokemonDadosUrl(completion: @escaping(() -> Void)) {
        guard let url = URL(string: pokemon.url ?? "") else { return }
        service.getPokemonSelected(url: url) { result, failure in
            self.pokemon.info = result
            completion()
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
