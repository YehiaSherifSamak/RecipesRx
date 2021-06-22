//
//  RecipeDetalisConfigurator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 21/06/2021.
//

import Foundation

class RecipeDetailsConfigurator{
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func config(view: RecipeDetailsViewController){
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        view.recipeViewModel = viewModel
    }
}
