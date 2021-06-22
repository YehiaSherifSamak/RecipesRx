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
    private let recipes = Recipe.recipes
    let recipeObservable: Observable<[RecipeUIModel]>
    
    func selectedRecipe(for index: IndexPath, route: RecipeRoute){
        route.presentDetailsView(for: recipes[index.row])
    }
    init() {
        recipeObservable = Observable.just(recipes.map{RecipeUIModel(recipe: $0)})
    }
}
