//
//  ViewController.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 20/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class RecipesViewController: UIViewController {
    
    
    static let storyboardID = "Main"
    static let viewControllerID = "RecipesViewController"
    
    static func getVC(viewModel: RecipesViewModel)-> RecipesViewController?{
        let storyboard = UIStoryboard.init(name: storyboardID, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID) as? RecipesViewController
        viewController?.viewModel = viewModel
        return viewController
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private let disposeBag = DisposeBag()
    var viewModel: RecipesViewModelProtcol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpTableView()
        setupCellTapHandling()
        viewModel.viewDidLoad()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            viewModel.viewDidDispear()
        }
    }
    
    func setUpTableView(){
        tableView.register(UINib(nibName: RecipeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.identifier)
        viewModel.recipeObservable.bind(to: tableView
                                            .rx
                                            .items(cellIdentifier: RecipeTableViewCell.identifier
                                                   , cellType: RecipeTableViewCell.self)){
            row, recipe, cell in
            cell.configure(recipe: recipe)
        }.disposed(by: disposeBag)
    }
    
    func setupCellTapHandling() {
        
        tableView
            .rx
            .itemSelected.do(onNext: { [weak self] indexPath in
                self?.viewModel.selectedRecipe(for: indexPath)
            })
        .subscribe().disposed(by: disposeBag)
    }
    
    
}

