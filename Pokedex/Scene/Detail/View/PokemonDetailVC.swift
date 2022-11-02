//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by İlkay Sever on 2.11.2022.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokedexNumber: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemonId: Int = 0
    var pokemonData: PokemonDetail?
    let pokemonDetailVM = PokemonDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPokemonDetailRequest()
        
    }
    
    private func getPokemonDetailRequest() {
        pokemonDetailVM.getPokemonsDetailFromApi(pokemonId: pokemonId) { response, error in
            if let error = error {
                debugPrint("error: \(error)")
            }
            DispatchQueue.main.async {
                self.pokemonData = self.pokemonDetailVM.getPokemonDetailList()
                
                self.view.backgroundColor = Colors.shared.getColor(type: self.pokemonData?.types?[0].type?.name ?? "")
                self.pokemonName.text = self.pokemonData?.name?.capitalized
                guard let pokedexNumber = self.pokemonData?.order,
                      let height = self.pokemonData?.height,
                      let weight = self.pokemonData?.weight  else { return }
                self.pokedexNumber.text = "#" + "\(pokedexNumber)"
                self.speciesLabel.text = self.pokemonData?.name?.capitalized
                self.heightLabel.text = "\(height)"
                self.weightLabel.text = "\(weight)"
                self.pokemonImg.setImageUrl(imageUrl: "https://cdn.traction.one/pokedex/pokemon/\(self.pokemonId).png")
                self.typeLabel.text = self.pokemonData?.types?[0].type?.name?.capitalized
                guard let ability1 = self.pokemonData?.abilities?[0].ability?.name else { return self.abilitiesLabel.text = "Unknown"}
                self.abilitiesLabel.text = ability1 
            }
        }
    }
    
    private func setupUI() {
        typeView.clipsToBounds = true
        typeView.layer.cornerRadius = 8
        
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
}
