//
//  HomeService.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 29/08/22.
//

import UIKit
import Alamofire

protocol PokemonServiceDelegate: GenericService {
    func getPokemon(completion: @escaping completion<Pokemon?>)
    func getPokemonSelected(url: URL, completion: @escaping completion<PokemonSelected?>)
}

class PokemonService : PokemonServiceDelegate {
    
    func getPokemon(completion: @escaping completion<Pokemon?>){
        let url: String = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0"
        AF.request(url, method: .get).validate().responseDecodable(of: Pokemon.self) { response in
            switch response.result {
            case .success(let data):
                completion(data,nil)
            case .failure(let error):
                completion(nil,Error.errorRequest(error))
            }
        }
    }
    
    func getPokemonSelected(url: URL, completion: @escaping completion<PokemonSelected?>){
        AF.request(url, method: .get).validate().responseDecodable(of: PokemonSelected.self) { response in
            switch response.result {
            case .success(let data):
                completion(data,nil)
            
            case .failure(let error):
                print("Error -> \(#function)")
                completion(nil,Error.errorRequest(error))
            }
        }
    }
}
