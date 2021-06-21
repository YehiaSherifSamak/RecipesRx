//
//  Recipe.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 20/06/2021.
//

import Foundation

struct Recipe: Equatable, Hashable{
    let name: String
    let energy: Int
    let quantity: Int
    
    static var recipes: [Recipe]  {
        let recipe1 = Recipe(name: "Can Chicken", energy: 185, quantity: 100)
        let recipe2 = Recipe(name: "Butter Chicken or Chicken Makhani", energy: 234, quantity: 100)
        let recipe3 = Recipe(name: "Alfredo - Chicken Alfredo, Chicken", energy: 102, quantity: 100)
        return [recipe1, recipe2, recipe3]
    }
}
