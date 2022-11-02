//
//  PokemonListVM.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import Foundation

protocol PokemonListVMProtocol {
    func getPokemonsFromApi(completion: @escaping((PokemonListModel?, String?) ->()))
    func getPokemonList() -> PokemonListModel?
}

class PokemonListVM: PokemonListVMProtocol {
    
    public var didSusscces: ()->() = { }
    public var didFailure: ()->() = { }
    
    private var pokemonData: PokemonListModel?
    
    init() {
        
    }
    
    func getPokemonsFromApi(completion: @escaping((PokemonListModel?, String?) ->())) {
        NetworkManager.request(type: PokemonListModel.self, url: "https://api-pokemons-go.herokuapp.com/pokemon/all/1/50", method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let pokemonData):
                completion(pokemonData, nil)
                self.pokemonData = pokemonData
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
    
    func getPokemonList() -> PokemonListModel? {
        return pokemonData
    }
    
}
