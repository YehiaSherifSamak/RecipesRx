//
//  RecpiesRoute.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 21/06/2021.
//

import UIKit


class RecipeRoute{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func presentDetailsView(for recipe: Recipe) {
        if let view = RecipeDetailsViewController.getVC(){
            navigationController.pushViewController(view, animated: true)
            RecipeDetailsConfigurator(recipe: recipe).config(view: view)
        }
    }
}
