//
//  PokemonListModel.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

typealias PokemonListModel = [PokemonListModelElement]

struct PokemonListModelElement: Codable {
    var id: Int?
    var name: String?
    var pokedexNumber: Int?
    var type1: String?
    var type2: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pokedexNumber = "pokedex_number"
        case type1 = "type_1"
        case type2 = "type_2"
    }
}
