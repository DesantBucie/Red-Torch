//
//  ViewController.swift
//  Red Torch
//
//  Created by dsnt on 01/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var on_button: UIButton!
    @IBOutlet weak var strobe: UIButton!
    
    var currentBrightneess = UIScreen.main.brightness;
    var isRunning = false
    var timer : Timer?
    var screenWidth = UIScreen.main.bounds.size.width;

    override func viewDidLoad() {
        super.viewDidLoad()
        on_button.tintColor = UIColor.red;
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func strobeFlash() {
        if(self.view.backgroundColor == UIColor.black){
            self.view.backgroundColor = UIColor.white;
        }
        else {
            self.view.backgroundColor = UIColor.black;
        }

    }
    func startTimer()
    {
      if timer == nil {
          timer = Timer.scheduledTimer(timeInterval: 0.7,
                                       target: self,
                                       selector: #selector(strobeFlash),
                                       userInfo: nil,
                                       repeats: true
          )
      }
    }

    func stopTimer()
    {
      if timer != nil {
        timer!.invalidate()
        timer = nil
      }
    }
    func setTorchButton(){
        currentBrightneess = UIScreen.main.brightness;
        on_button.setTitle("Off", for: .normal);
        self.view.backgroundColor = UIColor.red;
        on_button.tintColor = UIColor.black;
        UIScreen.main.brightness = CGFloat(1.0)
        strobe.isHidden = true;
    }
    func resetTorchButton(){
        on_button.setTitle("On", for:.normal);
        self.view.backgroundColor = UIColor.black;
        on_button.tintColor = UIColor.red;
        UIScreen.main.brightness = currentBrightneess;
    }
    func resetStrobeButton(){
        stopTimer();
        isRunning = false;
        self.view.backgroundColor = UIColor.black;
        strobe.setTitle("Strobe", for: .normal);
    }
    @IBAction func onClick(_ sender: UIButton) {
        let currentText = sender.titleLabel?.text
        if(currentText == "Off"){
            resetTorchButton()
            strobe.isHidden = false;
        }
        else {
            setTorchButton()
            strobe.isHidden = true
        }
    }
    @IBAction func strobe(_ sender: UIButton) {
        if(isRunning == false){
            on_button.isHidden = true;
            isRunning = true
            startTimer();
            strobe.setTitle("Off", for: .normal);
        }
        else {
            resetStrobeButton()
            on_button.isHidden = false;
        }
    }
}

