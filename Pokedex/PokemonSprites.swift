//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import Foundation

/// Contains url paths for a pokemon's sprites
public struct PokemonSprites: Codable {
    public var frontDefault: String?
    public var frontFemale: String?
    public var frontShiny: String?
    public var frontShinyFemale: String?
    
    public var backDefault: String?
    public var backFemale: String?
    public var backShiny: String?
    public var backShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
    }
}
