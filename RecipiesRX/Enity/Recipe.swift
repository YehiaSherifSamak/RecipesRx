//
//  Recipe.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 20/06/2021.
//

import Foundation

struct Recipe: Equatable, Hashable, Codable{
    let name: String
    let image: String
    let energy: Double
    let quantity: Double
    
    
    enum CodingKeys: String, CodingKey{
        case name = "label"
        case image = "image"
        case energy = "calories"
        case quantity = "totalWeight"
    }
}
