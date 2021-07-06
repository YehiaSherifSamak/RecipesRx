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
   
    var viewModel: RecipeDetailsViewModel!
  
    static func getVC(viewModel: RecipeDetailsViewModel)-> RecipeDetailsViewController?{
        let storyboard = UIStoryboard.init(name: storyboardID, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID) as? RecipeDetailsViewController
        viewController?.viewModel = viewModel
        return viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            viewModel.viewDidDispear()
        }
    }
    
    func setUpView(){
        titleLabel.text = viewModel.name
        engergyLabel.text = viewModel.energy
        quantityLabel.text = viewModel.quantity
    }
    
    
    

}
