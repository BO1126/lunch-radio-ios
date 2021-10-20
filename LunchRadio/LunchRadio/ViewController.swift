//
//  ViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var studentButton : UIButton!
    @IBOutlet weak var teacherButton : UIButton!
    @IBOutlet weak var LoginButton : UIButton!
    @IBOutlet weak var autoLoginToggleButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.borderWidth = 5
        mainView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        studentButton.clipsToBounds = true
        studentButton.layer.cornerRadius = 10
        studentButton.layer.borderWidth = 3
        studentButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        teacherButton.clipsToBounds = true
        teacherButton.layer.cornerRadius = 10
        teacherButton.layer.borderWidth = 3
        teacherButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        LoginButton.clipsToBounds = true
        LoginButton.layer.cornerRadius = 10
        LoginButton.layer.borderWidth = 3
        LoginButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
    }
    
    @IBAction func touchAutoLoginButton(){
        autoLoginToggleButton.isSelected.toggle()
    }


}

