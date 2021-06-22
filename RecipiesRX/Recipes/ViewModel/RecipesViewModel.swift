//
//  RecipesViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 22/06/2021.
//

import Foundation
import RxSwift

class RecipesViewModel{
    let title = "Recipes"
    let recipes = Observable.just(Recipe.recipes)
    
    func selectedRecipe(_ recipe: Recipe, route: RecipeRoute){
        route.presentDetailsView(for: recipe)
    }
}
