//
//  ViewController.swift
//  Red Torch
//
//  Created by dsnt on 01/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var on_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        on_button.tintColor = UIColor.red;
    }

    @IBAction func onClick(_ sender: UIButton) {
        let currentText = sender.titleLabel?.text
        if(currentText == "On"){
            on_button.setTitle("Off", for:.normal);
            self.view.backgroundColor = UIColor.black;
            on_button.tintColor = UIColor.red;
        }
        else {
            on_button.setTitle("On", for: .normal);
            self.view.backgroundColor = UIColor.red;
            on_button.tintColor = UIColor.black;
        }
    }
    
}

