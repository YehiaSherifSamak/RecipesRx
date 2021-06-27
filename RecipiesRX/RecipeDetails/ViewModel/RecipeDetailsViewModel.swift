//
//  RecipeDetailsViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 22/06/2021.
//

import Foundation

class RecipeDetailsViewModel{
    private let recipe: Recipe
    private weak var coordinator: RecipeDetailsCoordionator?
    
    var name: String {return recipe.name}
    var energy: String {return String(recipe.energy)}
    var quantity: String {return String(recipe.quantity)}
    
    init(recipe: Recipe, coordinator: RecipeDetailsCoordionator){
        self.recipe = recipe
        self.coordinator = coordinator
    }
    
    func viewDidDispear(){
        coordinator?.dismiss()
    }
}
