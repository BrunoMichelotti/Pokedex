//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 31/08/22.
//

import Foundation

struct PokemonSelected : Codable {
    let sprites: PokemonSprites?
    let stats: [Stat]?
}

struct PokemonSprites : Codable {
    var front_default: String?
}

struct Stat: Codable {
    let baseStat: Int?
    let effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct Species: Codable {
    var name: String?
    var url: String?
}
