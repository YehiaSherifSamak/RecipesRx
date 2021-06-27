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
    private weak var coordinator: RecipesCoordinator?
    
    
    let recipeObservable: Observable<[RecipeUIModel]>
    
    func selectedRecipe(for index: IndexPath){
        coordinator?.startRecipeDetails(recipe: recipes[index.row])
    }
    
    init(coordinator: RecipesCoordinator) {
        recipeObservable = Observable.just(recipes.map{RecipeUIModel(recipe: $0)})
        self.coordinator = coordinator
    }
    
    func viewDidDispear(){
        coordinator?.dismiss()
    }
}
