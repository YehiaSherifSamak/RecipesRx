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
    
     /* 
        1. This observable can be converted to [Publish Subject] because if you want to emit any new events inside it you will be able to do that with the subject you can do that 
        2. Second option here you can create your own observable
    */
    
    let recipeObservable: Observable<[RecipeUIModel]>
    
    func selectedRecipe(for index: IndexPath, route: RecipeRoute){
        route.presentDetailsView(for: recipes[index.row])
    }
    init() {
        recipeObservable = Observable.just(recipes.map{RecipeUIModel(recipe: $0)})
    }
}
