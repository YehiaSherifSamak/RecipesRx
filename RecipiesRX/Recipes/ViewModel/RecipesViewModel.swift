//
//  RecipesViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 22/06/2021.
//

import Foundation
import RxSwift

protocol RecipesViewModelProtcol {
    var title: String {get}
    var recipeObservable: Observable<[RecipeUIModel]> {get}
    func selectedRecipe(for index: IndexPath)
    func viewDidDispear()
}

class RecipesViewModel: RecipesViewModelProtcol{
    
    var title = "Recipes"
    
    
     let recipes = Recipe.recipes
     weak var coordinator: RecipesCoordinator?
    
    
    var recipeObservable: Observable<[RecipeUIModel]>
    
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
