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
    @IBOutlet weak var loginFailedLabel : UILabel!
    
    let border = CALayer()
    let border2 = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.activityIndicator)

        if Auth.auth().currentUser != nil {
            
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
        
        self.border.frame = CGRect(x: 0, y: emailTextfield.frame.size.height-1, width: emailTextfield.frame.width, height: 1)
        self.border.backgroundColor = UIColor.white.cgColor
        
        emailTextfield.layer.addSublayer(self.border)
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "이메일 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        self.border2.frame = CGRect(x: 0, y: passwordTextfield.frame.size.height-1, width: passwordTextfield.frame.width, height: 1)
        self.border2.backgroundColor = UIColor.white.cgColor
        
        passwordTextfield.layer.addSublayer(self.border2)
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    @IBAction func touchAutoLoginButton(){
        autoLoginToggleButton.isSelected.toggle()
    }
    
    @IBAction func touchLoginButton(){
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!){
            (user, error) in
            if user != nil{
                    let view = self.storyboard?.instantiateViewController(withIdentifier: "StudentVC")
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
            self.activityIndicator.stopAnimating()
        }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
            // Create an indicator.
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.center = self.view.center
            activityIndicator.color = UIColor.gray
            // Also show the indicator even when the animation is stopped.
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = UIActivityIndicatorView.Style.medium
            // Start animation.
            activityIndicator.stopAnimating()
            return activityIndicator }()


}

