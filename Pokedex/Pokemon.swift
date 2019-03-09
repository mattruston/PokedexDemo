//
//  Pokemon.swift
//  Pokedex
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import Foundation

/// A Pokemon!
public struct Pokemon: Codable {
    public var name: String
    public var id: Int
    public var sprites: PokemonSprites
}
