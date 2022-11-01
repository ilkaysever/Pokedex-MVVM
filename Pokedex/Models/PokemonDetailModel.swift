//
//  PokemonDetailModel.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

struct Ability: Codable {
    var ability: DataUrlModel?
    var slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability
        case slot
    }
}

struct Other:   Codable {
    var frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct OtherSpretie: Codable {
    var dreamWorld: Other?
    var home: Other?
    var officialArtwork: Other?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official_artwork"
        case home
    }
}

struct Sprities: Codable {
    var frontDefault: String?
    var backDefault: String?
    var backShiny: String?
    var frontShiny: String?
    var other: OtherSpretie?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontShiny = "front_shiny"
        case other
    }
}

struct Stat: Codable {
    var baseStat: Int?
    var effort: Int?
    var stat: DataUrlModel?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct Types: Codable {
    var slot: Int?
    var type: DataUrlModel?
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

struct PokemonDetail: Codable {
    var id: Int?
    var baseExperience: Int?
    var height: Int?
    var weight: Int?
    var abilities: [Ability]?
    var name: String?
    var order: Int?
    var sprities: Sprities?
    var stats: [Stat]?
    var types: [Types]?
    var species: DataUrlModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case baseExperience = "base_experience"
        case height
        case weight
        case abilities
        case name
        case order
        case sprities
        case stats
        case types
        case species
    }
}
