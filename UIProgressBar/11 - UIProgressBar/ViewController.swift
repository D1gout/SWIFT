//
//  ViewController.swift
//  10 - UIProgressBar
//
//  Created by Даниил Ащев on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var progress: Float = 0
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonStart: UIButton!
    
    @IBAction func pushStartAction(_ sender: Any) {
        progress = 0
        ImageView.image = nil
        
        buttonStart.isHidden = true
        progressView.isHidden = false

        timer = Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(ViewController.tic), userInfo: nil, repeats: true)
        timer?.fire()
        activityIndicator.startAnimating()
    }
    
    @objc func tic() {
        progress += 0.1
        progressView.progress = progress
        if progress>=1 {
            timer?.invalidate()
            progressView.progress = 0
            ImageView.image = UIImage(named: "doska.png")
            activityIndicator.stopAnimating()
            buttonStart.isHidden = false
            progressView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

