//
//  PokemonDetailVM.swift
//  Pokedex
//
//  Created by İlkay Sever on 2.11.2022.
//

import Foundation

protocol PokemonDetailVMProtocol {
    func getPokemonsDetailFromApi(pokemonId: Int, completion: @escaping((PokemonDetail?, String?) ->()))
    func getPokemonDetailList() -> PokemonDetail?
}

class PokemonDetailVM: PokemonDetailVMProtocol {
    
    public var didSusscces: ()->() = { }
    public var didFailure: ()->() = { }
    
    private var pokemonDetailData: PokemonDetail?
    
    init() {
        
    }
    
    func getPokemonsDetailFromApi(pokemonId: Int, completion: @escaping((PokemonDetail?, String?) ->())) {
        NetworkManager.request(type: PokemonDetail.self, url: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)", method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let pokemonDetailData):
                completion(pokemonDetailData, nil)
                self.pokemonDetailData = pokemonDetailData
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
    
    func getPokemonDetailList() -> PokemonDetail? {
        return pokemonDetailData
    }
    
}
