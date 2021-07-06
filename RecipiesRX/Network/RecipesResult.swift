//
//  RecipesResult.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 06/07/2021.
//

import Foundation

struct RecipesResult: Decodable{
    var from: Int
    var to: Int
    var more: Bool
    var hits: [RecipeResult]
    var recipes: [Recipe]{
        return hits.map{$0.recipe}
    }
}

struct RecipeResult: Decodable {
    let recipe: Recipe
}
