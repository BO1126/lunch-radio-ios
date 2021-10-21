//
//  SettingViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var logoutButton : UIButton!
    @IBOutlet weak var helpLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.borderWidth = 5
        mainView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        logoutButton.clipsToBounds = true
        logoutButton.layer.cornerRadius = 10
        logoutButton.layer.borderWidth = 3
        logoutButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        helpLabel.text = "총괄 : 최우진\n디자인 : 장평화, 백승민(도움)\niOS : 이정우\n불만 사항 있을 시 3-7로 오세요"

        // Do any additional setup after loading the view.
    }
    

}