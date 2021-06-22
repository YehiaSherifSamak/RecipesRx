//
//  RecipeUIView.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 22/06/2021.
//

import Foundation

class RecipeUIModel{
    private let recipe: Recipe
    var name: String{
        return recipe.name
    }
    var energy: String{
        return String(recipe.energy)
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
