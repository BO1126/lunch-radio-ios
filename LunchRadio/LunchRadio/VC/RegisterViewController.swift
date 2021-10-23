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
    @IBOutlet weak var registerFailedLabel : UILabel!
    
    let border = CALayer()
    let border2 = CALayer()
    let border3 = CALayer()
    let border4 = CALayer()
    let border5 = CALayer()
    
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
        
        self.border.frame = CGRect(x: 0, y: emailTextfield.frame.size.height-1, width: emailTextfield.frame.width, height: 1)
        self.border.backgroundColor = UIColor.white.cgColor
        
        emailTextfield.layer.addSublayer(self.border)
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        self.border2.frame = CGRect(x: 0, y: passwordTextfield.frame.size.height-1, width: passwordTextfield.frame.width, height: 1)
        self.border2.backgroundColor = UIColor.white.cgColor
        
        passwordTextfield.layer.addSublayer(self.border2)
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        self.border3.frame = CGRect(x: 0, y: passwordCheckTextfield.frame.size.height-1, width: passwordCheckTextfield.frame.width, height: 1)
        self.border3.backgroundColor = UIColor.white.cgColor
        
        passwordCheckTextfield.layer.addSublayer(self.border3)
        passwordCheckTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        self.border4.frame = CGRect(x: 0, y: studentNumTextfield.frame.size.height-1, width: studentNumTextfield.frame.width, height: 1)
        self.border4.backgroundColor = UIColor.white.cgColor
        
        studentNumTextfield.layer.addSublayer(self.border4)
        studentNumTextfield.attributedPlaceholder = NSAttributedString(string: "학번 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        self.border5.frame = CGRect(x: 0, y: nameTextfield.frame.size.height-1, width: nameTextfield.frame.width, height: 1)
        self.border5.backgroundColor = UIColor.white.cgColor
        
        nameTextfield.layer.addSublayer(self.border5)
        nameTextfield.attributedPlaceholder = NSAttributedString(string: "이름 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
    }
    
    @IBAction func touchRegisterButton(){
        var checkValue = 0
        checkValue += registerTextFieldCheck(textfield: emailTextfield, textfieldPlaceholder: "이메일 입력", border: border)
        checkValue += registerTextFieldCheck(textfield: passwordTextfield, textfieldPlaceholder: "비밀번호 입력", border: border2)
        checkValue += registerTextFieldCheck(textfield: passwordCheckTextfield, textfieldPlaceholder: "비밀번호 확인", border: border3)
        checkValue += registerTextFieldCheck(textfield: studentNumTextfield, textfieldPlaceholder: "학번 입력", border: border4)
        checkValue += registerTextFieldCheck(textfield: nameTextfield, textfieldPlaceholder: "이름 입력", border: border5)
        
        if(checkValue == 5){
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!){
                (user, error) in
                if user !=  nil{
                    print("register success")
                    self.dismiss(animated: true)
                }
                else{
                    print("register failed")
                }
            }
        }else{
            registerFailedLabel.text = "입력란을 확인해 주세요!"
        }
    }
    
    func registerTextFieldCheck(textfield : UITextField, textfieldPlaceholder : String, border : CALayer) -> Int{
        if(textfield.text! == ""){
            border.backgroundColor = UIColor.red.cgColor
            textfield.attributedPlaceholder = NSAttributedString(string: textfieldPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return 0
        }else{
            if(textfieldPlaceholder == "비밀번호 확인"){
                if(self.passwordTextfield.text == textfield.text){
                    border.backgroundColor = UIColor.white.cgColor
                    textfield.attributedPlaceholder = NSAttributedString(string: textfieldPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
                    return 1
                }else{
                    border.backgroundColor = UIColor.red.cgColor
                    textfield.attributedPlaceholder = NSAttributedString(string: textfieldPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
                    return 0
                }
            }
            border.backgroundColor = UIColor.white.cgColor
            textfield.attributedPlaceholder = NSAttributedString(string: textfieldPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            return 1
        }
    }
    
    @IBAction func touchDismissButton(){
        dismiss(animated: true)
    }

}
