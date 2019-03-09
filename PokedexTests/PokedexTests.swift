//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Matthew Ruston on 3/9/19.
//  Copyright © 2019 Under Armour, Inc. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {

    // testing the endpoint
    func testFetchPokemon() {
        let pokedex = Pokedex()
        
        let expect = expectation(description: "fetch")

        pokedex.fetch(pokemon: 1) { (result) in
            switch result {
            case let .success(pokemon):
                print(pokemon)
            case let .error(error):
                print(error)
            }
            expect.fulfill()
        }

        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Timeout: \(error)")
            }
        }
    }

}
