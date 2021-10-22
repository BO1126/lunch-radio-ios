//
//  RegisterViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var registerButton : UIButton!
    @IBOutlet weak var dismissButton : UIButton!
    @IBOutlet weak var emailTextfield : UITextField!
    @IBOutlet weak var passwordTextfield : UITextField!
    @IBOutlet weak var passwordCheckTextfield : UITextField!
    @IBOutlet weak var studentNumTextfield : UITextField!
    @IBOutlet weak var nameTextfield : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.borderWidth = 5
        mainView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth = 3
        registerButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        dismissButton.clipsToBounds = true
        dismissButton.layer.cornerRadius = 10
        dismissButton.layer.borderWidth = 3
        dismissButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchRegisterButton(){
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!){
            (user, error) in
            if user !=  nil{
                    print("register success")
                }
                else{
                    print("register failed")
                }
        }
    }
    
    @IBAction func touchDismissButton(){
        dismiss(animated: true)
    }

}
