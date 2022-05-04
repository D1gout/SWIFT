//
//  ViewController.swift
//  18 - UIWebView
//
//  Created by Даниил Ащев on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        webView.delegate = self
        
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let url = NSURL(string: textField.text!) {
            let  request NSURLRequest(url)
            webView.loadRequest(request)
        }
        
        return true
    }
}

extension ViewController: UIWebViewDelegate {
    
}

