//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Даниил Ащев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var aP = 1 //Krestik
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (aP == 1)
        {
            sender.setImage(UIImage(named: "Krestik.png"), for: UIControl.State())
            aP = 2
        }
        else
        {
            sender.setImage(UIImage(named: "Nolik.png"), for: UIControl.State())
            aP = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

