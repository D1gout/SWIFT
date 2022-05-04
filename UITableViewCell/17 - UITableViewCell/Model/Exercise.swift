//
//  Exercise.swift
//  17 - UITableViewCell
//
//  Created by Даниил Ащев on 28.03.2022.
//

import UIKit

var dataArray: [Exercise] {
     
    return [Exercise(name: "Футболка", image: UIImage(named: "1.png")), Exercise(name: "Кросовка", image: UIImage(named: "2.png")), Exercise(name: "Штанишка", image: UIImage(named: "3.png"))]
     
}

class Exercise {
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage?){
        self.name = name
        self.image = image
    }

}
