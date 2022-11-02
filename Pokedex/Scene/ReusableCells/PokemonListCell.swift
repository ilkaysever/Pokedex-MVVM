//
//  PokemonListCell.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import UIKit

class PokemonListCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilityView: UIView!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        
        typeView.layer.cornerRadius = 5
        typeView.clipsToBounds = true
        
        abilityView.layer.cornerRadius = 5
        abilityView.clipsToBounds = true
    }
    
    func configurePokemonCell(pokemonData: PokemonListModelElement?) {
        guard let pokemonId = pokemonData?.id else { return }
        let imgUrl = "https://cdn.traction.one/pokedex/pokemon/\(pokemonId).png"
        pokemonImg.setImageUrl(imageUrl: imgUrl)
        pokemonName.text = pokemonData?.name
        containerView.backgroundColor = Colors.shared.getColor(type: pokemonData?.type1 ?? "")
        if pokemonData?.type1 != "" && pokemonData?.type2 != "" {
            typeView.isHidden = false
            typeLabel.text = pokemonData?.type1
            abilityView.isHidden = false
            abilityLabel.text = pokemonData?.type2
        } else if pokemonData?.type1 != "" && pokemonData?.type2 == "" {
            typeView.isHidden = false
            typeLabel.text = pokemonData?.type1
            abilityView.isHidden = false
            abilityView.backgroundColor = .clear
            abilityLabel.text = pokemonData?.type2
        }
    }
}
