//
//  SettingViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit
import FirebaseAuth

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
        
        helpLabel.text = "총괄 : 최우진\n디자인 : 장평화, 백승민\niOS : 이정우\n문의 사항은 리뷰로 남겨주세요."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchLogoutButton(){
        let firebaseAuth = Auth.auth()
        do {
            UserDefaults.standard.removeObject(forKey: "id")
            UserDefaults.standard.removeObject(forKey: "pwd")
            try firebaseAuth.signOut()
            self.dismiss(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func touchDeleteButton(){
        let alert = UIAlertController(title: "정말로 탈퇴하시겠습니까?", message: "탈퇴 시 급식무전기 서비스 이용이 불가능합니다.", preferredStyle: UIAlertController.Style.alert)
        
        let deleteAction = UIAlertAction(title: "탈퇴", style: .destructive){
            (action) in
            Auth.auth().currentUser?.delete{
                error in
                if let error = error{
                    print(error)
                }else{
                    UserDefaults.standard.removeObject(forKey: "id")
                    UserDefaults.standard.removeObject(forKey: "pwd")
                    self.dismiss(animated: true)
                }
                
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true)
    }

}
