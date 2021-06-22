//
//  RecipeDetalisConfigurator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 21/06/2021.
//

import Foundation

// This could be struct not a class 

class RecipeDetailsConfigurator {
    
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func config(view: RecipeDetailsViewController) is {
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        view.recipeViewModel = viewModel
    }
}

/*
enum RecipeConfigurator: Configurator {
    
    case list
    case details(recipe: Recipe)
    
    var destinationViewController: UIViewController {
        switch self {
        case .details(let recipe):
            // Here return the recipe details
        case .list:
        // Here return the list viewcontroller
        }
    }
}

*/

