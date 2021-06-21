//
//  RecipeDetailsViewController.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 21/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class RecipeDetailsViewController: UIViewController {
    
    static let storyboardID = "RecipeDetails"
    static let viewControllerID = "RecipeDetailsViewController"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var engergyLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
   
    let disposeBag = DisposeBag()
    var parentVC: RecipesViewController?
    
    
    static func getVC()-> RecipeDetailsViewController?{
        let storyboard = UIStoryboard.init(name: storyboardID, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID) as? RecipeDetailsViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vc = parentVC{
            vc.selectedRecipee.subscribe(onNext:{
               [weak self] recipe in
                self?.setUpView(recipe: recipe)
            }).disposed(by: disposeBag)
        }
        
    }
    
    func setUpView(recipe: Recipe){
        titleLabel.text = recipe.name
        engergyLabel.text = String(recipe.energy)
        quantityLabel.text = String(recipe.quantity)
    }
    
    
    

}
