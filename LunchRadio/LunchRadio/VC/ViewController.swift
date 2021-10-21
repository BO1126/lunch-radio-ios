//
//  ViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/06.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var studentButton : UIButton!
    @IBOutlet weak var teacherButton : UIButton!
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var autoLoginToggleButton : UIButton!
    @IBOutlet weak var emailTextfield : UITextField!
    @IBOutlet weak var passwordTextfield : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let user = Auth.auth().currentUser {
            
        }
        
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
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: emailTextfield.frame.size.height-1, width: emailTextfield.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        
        emailTextfield.layer.addSublayer(border)
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: passwordTextfield.frame.size.height-1, width: passwordTextfield.frame.width, height: 1)
        border2.backgroundColor = UIColor.white.cgColor
        
        passwordTextfield.layer.addSublayer(border2)
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
        
    }
    
    @IBAction func touchAutoLoginButton(){
        autoLoginToggleButton.isSelected.toggle()
    }


}

