//
//  RecipesViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 22/06/2021.
//

import Foundation
import RxSwift
import Moya

protocol RecipesViewModelProtcol {
    var title: String {get}
    var recipeObservable: PublishSubject<[RecipeUIModel]> {get}
    func selectedRecipe(for index: IndexPath)
    func viewDidDispear()
    func viewDidLoad()
}

class RecipesViewModel: RecipesViewModelProtcol{
    
     var title = "Recipes"
     var recipeObservable: PublishSubject<[RecipeUIModel]>
     
    private var recipes: [Recipe] = [Recipe]()
     private weak var coordinator: RecipesCoordinator?
     private let service = RecipesService()
     private let disposeBag = DisposeBag()
    
    func selectedRecipe(for index: IndexPath){
        coordinator?.startRecipeDetails(recipe: recipes[index.row])
    }
    
    init(coordinator: RecipesCoordinator) {
        recipeObservable = PublishSubject<[RecipeUIModel]>()
        self.coordinator = coordinator
    }
    
    func viewDidDispear(){
        coordinator?.dismiss()
    }
    
    func viewDidLoad(){
        service
            .getRecipes()
            .subscribe { [weak self] event in
                switch event{
                case .error(let error):
                    print(error)
                case .next(let newRecipes):
                    self?.recipes = newRecipes
                    self?.recipeObservable.onNext(newRecipes.map{RecipeUIModel(recipe: $0)})
                case .completed:
                    print("done")
                }
                
        }.disposed(by: disposeBag)



    }
}
