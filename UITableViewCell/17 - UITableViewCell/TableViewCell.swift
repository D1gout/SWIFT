//
//  TableViewCell.swift
//  17 - UITableViewCell
//
//  Created by Даниил Ащев on 28.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageExercise: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var exercise: Exercise?
    
    func initCell(exercise: Exercise) {
        self.exercise = exercise
        
        imageExercise.image = exercise.image
        label.text = exercise.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
