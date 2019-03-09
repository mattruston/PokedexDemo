//
//  Result.swift
//  Pokedex
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import Foundation

public enum Result<T> {
    case error(Error?)
    case success(T)
}
