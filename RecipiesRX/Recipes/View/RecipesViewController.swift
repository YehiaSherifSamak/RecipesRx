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
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private let disposeBag = DisposeBag()
    let recipes = Observable.just(Recipe.recipes)
    let viewModel = RecipesViewModel()
    var route : RecipeRoute!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navBar = navigationController{
            route = RecipeRoute(navigationController: navBar)
        }
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpTableView()
        setupCellTapHandling()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setUpTableView(){
        tableView.register(UINib(nibName: RecipeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.identifier)
        viewModel.recipes.bind(to: tableView
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
        .modelSelected(Recipe.self)
        .subscribe(onNext: { [unowned self] recipe in
            viewModel.selectedRecipe(recipe, route: route)
        })
        .disposed(by: disposeBag)
    }
}

