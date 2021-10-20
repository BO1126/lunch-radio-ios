//
//  MainTabBarViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/20.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.layer.borderWidth = 3
        self.tabBar.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        self.tabBar.clipsToBounds = true
        self.tabBar.layer.cornerRadius = 50
        self.tabBar.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        // Do any additional setup after loading the view.
    }
    

}
