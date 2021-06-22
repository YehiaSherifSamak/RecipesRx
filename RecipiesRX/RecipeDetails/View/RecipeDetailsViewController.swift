//
//  RecipeDetailsViewController.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 21/06/2021.
//

import UIKit


class RecipeDetailsViewController: UIViewController {
    
    static let storyboardID = "RecipeDetails"
    static let viewControllerID = "RecipeDetailsViewController"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var engergyLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
   
    var recipeViewModel: RecipeDetailsViewModel!
  
    static func getVC()-> RecipeDetailsViewController?{
        let storyboard = UIStoryboard.init(name: storyboardID, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID) as? RecipeDetailsViewController
        return viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        titleLabel.text = recipeViewModel.name
        engergyLabel.text = recipeViewModel.energy
        quantityLabel.text = recipeViewModel.quantity
    }
    
    
    

}
