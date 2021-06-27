//
//  RecipesCoordinator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 27/06/2021.
//

import UIKit

class RecipesCoordinator: Coordinator{
     var childCoordinators: [Coordinator] = []
     var parentCoordinator: LoginCoordinator?
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = RecipesViewModel(coordinator: self)
        guard let viewController = RecipesViewController.getVC(viewModel:  viewModel) else {return}
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startRecipeDetails(recipe: Recipe){
        let recipeDetailsCoordinator = RecipeDetailsCoordionator(recipe: recipe, navigationController: navigationController)
        childCoordinators.append(recipeDetailsCoordinator)
        recipeDetailsCoordinator.parent = self
        recipeDetailsCoordinator.start()
    }
    
    func childDidFinish(child: Coordinator){
        if let index = childCoordinators.firstIndex { $0 === child }{
            childCoordinators.remove(at: index)
        }
    }
    
    func dismiss(){
        parentCoordinator?.childDidFinish(child: self)
    }
    
    
}
