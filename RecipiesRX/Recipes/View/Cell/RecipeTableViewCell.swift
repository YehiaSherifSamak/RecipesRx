//
//  RecipeTableViewCell.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 20/06/2021.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var energyLabel: UILabel?
   
    
    static let identifier = "RecipeTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(recipe: Recipe){
        nameLabel?.text = recipe.name
        energyLabel?.text = String(recipe.energy)
    }
}
