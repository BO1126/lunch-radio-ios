//
//  TeacherCheckViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit

class TeacherCheckViewController: UIViewController {

    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var pushButton : UIButton!
    @IBOutlet weak var finishButton : UIButton!
    @IBOutlet weak var gradeTextfield : UITextField!
    @IBOutlet weak var classTextfield : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.borderWidth = 5
        mainView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        pushButton.clipsToBounds = true
        pushButton.layer.cornerRadius = 10
        pushButton.layer.borderWidth = 3
        pushButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        finishButton.clipsToBounds = true
        finishButton.layer.cornerRadius = 10
        finishButton.layer.borderWidth = 3
        finishButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: gradeTextfield.frame.size.height-1, width: gradeTextfield.frame.width, height: 1)
        border.backgroundColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        gradeTextfield.layer.addSublayer(border)
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: classTextfield.frame.size.height-1, width: classTextfield.frame.width, height: 1)
        border2.backgroundColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        classTextfield.layer.addSublayer(border2)

        // Do any additional setup after loading the view.
    }


}

