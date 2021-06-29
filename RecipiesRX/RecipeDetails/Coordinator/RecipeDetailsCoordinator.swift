//
//  RecipeDetailsCoordinator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 27/06/2021.
//

import UIKit

class RecipeDetailsCoordionator: Coordinator{
    var childCoordinators: [Coordinator] = []
    var recipe: Recipe
    var navigationController: UINavigationController
    var parent: Coordinator?
    
    init(recipe: Recipe, navigationController: UINavigationController) {
        self.recipe = recipe
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = RecipeDetailsViewModel(recipe: recipe, coordinator: self)
        guard let viewController = RecipeDetailsViewController.getVC(viewModel: viewModel) else {return}
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
