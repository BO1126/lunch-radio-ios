//
//  TeacherLoginViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/22.
//

import UIKit
import FirebaseAuth

class TeacherLoginViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var studentButton : UIButton!
    @IBOutlet weak var teacherButton : UIButton!
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var autoLoginToggleButton : UIButton!
    @IBOutlet weak var emailTextfield : UITextField!
    @IBOutlet weak var passwordTextfield : UITextField!
    @IBOutlet weak var loginFailedLabel : UILabel!
    
    var isAutoLogin = false
    let border = CALayer()
    let border2 = CALayer()

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
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        border.frame = CGRect(x: 0, y: emailTextfield.frame.size.height-1, width: emailTextfield.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        
        emailTextfield.layer.addSublayer(border)
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        border2.frame = CGRect(x: 0, y: passwordTextfield.frame.size.height-1, width: passwordTextfield.frame.width, height: 1)
        border2.backgroundColor = UIColor.white.cgColor
        
        passwordTextfield.layer.addSublayer(border2)
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
        
    }
    
    @IBAction func touchAutoLoginButton(){
        autoLoginToggleButton.isSelected.toggle()
        if autoLoginToggleButton.isSelected == true{
            isAutoLogin = true
        }else{
            isAutoLogin = false
        }
    }
    
    @IBAction func touchLoginButton(){
        if(emailTextfield.text! == "smc02315@gmail.com" && passwordTextfield.text! == "smcteacher"){
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!){
                (user, error) in
                if user != nil{
                    if self.isAutoLogin{
                        UserDefaults.standard.set(self.emailTextfield.text, forKey: "id")
                        UserDefaults.standard.set(self.passwordTextfield.text, forKey: "pwd")
                    }
                    let view = self.storyboard?.instantiateViewController(withIdentifier: "TeacherVC")
                    view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    view?.modalPresentationStyle = .fullScreen
                    self.present(view!, animated: true, completion: nil)
                }
                else{
                    self.border.backgroundColor = UIColor.red.cgColor
                    self.border2.backgroundColor = UIColor.red.cgColor
                    self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
                    self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
                    self.loginFailedLabel.text = "이메일과 비밀번호가 일치하지 않습니다!"
                }
            }
        }else{
            self.border.backgroundColor = UIColor.red.cgColor
            self.border2.backgroundColor = UIColor.red.cgColor
            self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            self.loginFailedLabel.text = "이메일과 비밀번호가 일치하지 않습니다!"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }

}

