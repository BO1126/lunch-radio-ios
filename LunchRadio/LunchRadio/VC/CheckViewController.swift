//
//  CheckViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit

class CheckViewController: UIViewController {

    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var reloadButton : UIButton!
    @IBOutlet weak var checkLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.borderWidth = 5
        mainView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        reloadButton.clipsToBounds = true
        reloadButton.layer.cornerRadius = 10
        reloadButton.layer.borderWidth = 3
        reloadButton.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        checkLabel.text = "지금은\n점심시간이\n아닙니다"

        // Do any additional setup after loading the view.
    }


}
