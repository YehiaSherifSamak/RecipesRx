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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        setUpTableView()
        setupCellTapHandling()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setUpTableView(){
        recipes.bind(to: tableView
                        .rx
                        .items(cellIdentifier: RecipeTableViewCell.identifier
                               , cellType: RecipeTableViewCell.self)){
            row, recipe, cell in
            cell.configure(recipe: recipe)
        }.disposed(by: disposeBag)
    }
    func setupCellTapHandling() {
        tableView.register(UINib(nibName: RecipeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.identifier)
      tableView
        .rx
        .modelSelected(Recipe.self)
        .subscribe(onNext: { [unowned self] recipe in
            if let navBar = navigationController{
                RecipeRoute(navigationController: navBar).presentDetailsView(for: recipe)
            }
        })
        .disposed(by: disposeBag)
    }
    
    
    
}

