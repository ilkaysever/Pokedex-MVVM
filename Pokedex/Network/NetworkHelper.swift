//
//  NetworkHelper.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//
import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case unknownError = "An error unknown"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/ditto"
    
    
}
