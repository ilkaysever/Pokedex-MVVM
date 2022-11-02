//
//  DataUrlModel.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

struct DataUrlModel: Codable {
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
