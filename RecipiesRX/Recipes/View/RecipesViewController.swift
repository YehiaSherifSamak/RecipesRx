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
    let selectedRecipee = BehaviorSubject<Recipe>(value: Recipe(name: "", energy: 0, quantity: 0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        tableView.register(UINib(nibName: RecipeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.identifier)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        setUpTableView()
        setupCellTapHandling()
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
      tableView
        .rx
        .modelSelected(Recipe.self)
        .subscribe(onNext: { [unowned self] recipe in
            self.selectedRecipee.onNext(recipe)
            
            if let detailedVC = RecipeDetailsViewController.getVC(){
                detailedVC.parentVC = self
                self.navigationController?.pushViewController(detailedVC, animated: true)
                
            }
        })
        .disposed(by: disposeBag)
    }
    


}

