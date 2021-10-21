//
//  RegisterViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var registerButton : UIButton!
    
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
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
