//
//  ViewController.swift
//  19 - MailSending
//
//  Created by Даниил Ащев on 04.04.2022.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    var mailController = MFMailComposeViewController()
    
    @IBAction func pushSendMailAction(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

