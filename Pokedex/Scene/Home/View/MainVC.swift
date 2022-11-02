//
//  MainVC.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let pokemonListVM = PokemonListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getPokemonListRequest()
        
    }
    
    private func getPokemonListRequest() {
        pokemonListVM.getPokemonsFromApi { response, errorMessage  in
            if let errorMessage = errorMessage {
                debugPrint("error: \(errorMessage)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonListCell.self)
    }
    
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pokemonListVM.getPokemonList()?.count != 0 {
            return pokemonListVM.getPokemonList()?.count ?? 0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListCell.self), for: indexPath) as? PokemonListCell else { return UITableViewCell() }
        cell.configurePokemonCell(pokemonData: pokemonListVM.getPokemonList()?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = PokemonDetailVC()
        nextVC.pokemonId = pokemonListVM.getPokemonList()?[indexPath.row].id ?? 0
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
