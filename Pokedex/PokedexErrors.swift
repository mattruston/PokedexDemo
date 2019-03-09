//
//  PokedexErrors.swift
//  Pokedex
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import Foundation

public enum PokedexError: Error {
    case invalidUrl
    case missingPokemonData
    case decodeFailed
}
