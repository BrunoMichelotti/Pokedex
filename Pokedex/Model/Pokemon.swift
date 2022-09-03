//
//  Pokemon.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 29/08/22.
//

import Foundation

import Foundation

struct Pokemon : Codable{
    var results: [PokemonEntry]?
}

struct PokemonEntry : Codable{
    var name: String?
    var url: String?
    var info: PokemonSelected?
}

