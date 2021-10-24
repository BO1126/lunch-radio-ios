//
//  CheckViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class CheckViewController: UIViewController {

    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var reloadButton : UIButton!
    @IBOutlet weak var checkLabel : UILabel!
    
    let ref = Database.database().reference()

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
        
        ref.child("nowclass").child("NowClass").observe(.value){
            snapshot in
            let value = snapshot.value as! [String : String]
            let grade : String = value["grade"]!
            let number : String = value["number"]!
            self.checkLabel.text = "지금은\n\(grade)학년 \(number)반\n입니다."
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicator.startAnimating()
        print("aa")
        ref.child("nowclass").child("NowClass").observe(.value){
            snapshot in
            let value = snapshot.value as! [String : String]
            let grade : String = value["grade"]!
            let number : String = value["number"]!
            self.checkLabel.text = "지금은\n\(grade)학년 \(number)반\n입니다."
        }
        
    }
    
    @IBAction func touchReloadButton(){
        viewWillAppear(true)
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
