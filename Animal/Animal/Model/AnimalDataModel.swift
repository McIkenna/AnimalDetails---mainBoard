//
//  AnimalDataModel.swift
//  Animal
//
//  Created by New Account on 10/23/21.
//

import Foundation

struct AnimalDataModel : Codable {
    let errorMessage : String
    let animals : [Animal]
    
    enum CodingKeys : String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

struct Animal : Codable {
    let name : String
    let image : String
    
}
