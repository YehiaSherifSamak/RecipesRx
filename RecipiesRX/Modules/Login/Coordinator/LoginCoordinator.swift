//
//  LoginCoordinator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 27/06/2021.
//

import UIKit

class LoginCoordinator: Coordinator{
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController.getVC(viewModel: viewModel)!
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func startRecipes(){
        let recipesCoordinator = RecipesCoordinator(navigationController: navigationController)
        childCoordinators.append(recipesCoordinator)
        recipesCoordinator.parent = self
        recipesCoordinator.start()
    }
}
