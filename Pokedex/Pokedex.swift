//
//  Pokedex.swift
//  Pokedex
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import Foundation

/// A pokedex that can look up and tell you about pokemon!
public class Pokedex {
    
    private static let cacheKey = "PokemonCache"
    private var simpleCache: [Int: Pokemon] = [:]
    
    // MARK: - Lifecycle
    
    public init() {
        loadCache()
    }
    
    deinit {
        saveCache()
    }
    
    // MARK: - Public API
    
    /// Fetches a pokemon by id
    ///
    /// - Parameters:
    ///   - id: The id of the pokemon
    ///   - completion: Callback that either provides a pokemon or an error
    public func fetch(pokemon id: Int, completion: @escaping ((Result<Pokemon>) -> Void)) {
        if let pokemon = simpleCache[id] {
            completion(.success(pokemon))
            return
        }
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
            completion(.error(PokedexError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else {
                completion(.error(nil))
                return
            }
            
            if let error = error {
                completion(.error(error))
                return
            }
            
            guard let data = data else {
                completion(.error(PokedexError.missingPokemonData))
                return
            }
            
            guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {
                completion(.error(PokedexError.decodeFailed))
                return
            }
            
            self.simpleCache[id] = pokemon
            completion(.success(pokemon))
        }.resume()
    }
    
    // MARK: - Simple cache
    
    private func saveCache() {
        guard let data = try? JSONEncoder().encode(simpleCache) else {
            print("Failed to cache")
            return
        }
        
        UserDefaults.standard.set(data, forKey: Pokedex.cacheKey)
        print("Saved!")
    }
    
    private func loadCache() {
        guard let data = UserDefaults.standard.object(forKey: Pokedex.cacheKey) as? Data else {
            return
        }
        
        simpleCache = (try? JSONDecoder().decode([Int: Pokemon].self, from: data)) ?? [:]
    }
}
