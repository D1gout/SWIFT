//
//  ViewController.swift
//  17 - UITableViewCell
//
//  Created by Даниил Ащев on 28.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var exercise: Exercise?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = exercise?.name
        image.image = exercise?.image
    }


}

