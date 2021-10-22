//
//  LunchViewController.swift
//  LunchRadio
//
//  Created by 이정우 on 2021/10/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class LunchViewController: UIViewController {
    
    @IBOutlet weak var todayView : UIView!
    @IBOutlet weak var tomorrowView : UIView!
    @IBOutlet weak var todayLabel : UILabel!
    @IBOutlet weak var tomorrowLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayView.clipsToBounds = true
        todayView.layer.cornerRadius = 30
        todayView.layer.borderWidth = 5
        todayView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        tomorrowView.clipsToBounds = true
        tomorrowView.layer.cornerRadius = 30
        tomorrowView.layer.borderWidth = 5
        tomorrowView.layer.borderColor = CGColor(red: 233/255, green: 173/255, blue: 95/255, alpha: 1)
        
        getLunchData()
        getTomorrowLunchData()
        // Do any additional setup after loading the view.
    }
    
    func getLunchData(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let todayDate = formatter.string(from: Date())
        
        let url = "https://open.neis.go.kr/hub/mealServiceDietInfo?Type=json&pIndex=1&pSize=1&ATPT_OFCDC_SC_CODE=B10&SD_SCHUL_CODE=7010537&MLSV_YMD="+todayDate+"&KEY=b59b0495fbd2464ca7b0250bc360e0e2"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default,headers: [:]).responseJSON{
            response in
            switch response.result {
            case .success(let value):
                let json : JSON = JSON(value)
                if json["mealServiceDietInfo"].exists(){
                    let meal = json["mealServiceDietInfo"].arrayValue[1]
                    let row = meal["row"].arrayValue[0]
                    let ddishNm = row["DDISH_NM"].stringValue
                    let lunchString = ddishNm.replacingOccurrences(of: "<br/>", with: "\n")
                    let removeNumberString : String = lunchString.components(separatedBy: CharacterSet.decimalDigits).joined()
                    let removeDotString : String = removeNumberString.replacingOccurrences(of: ".", with: "")
                    self.todayLabel.text = removeDotString
                }else{
                    self.todayLabel.text = "오늘은 급식이 없습니다"
                }
            default:
                return
            }
        }
    }
    
    func getTomorrowLunchData(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let tomoDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let tomorrowDate = formatter.string(from: tomoDate)
        
        let url = "https://open.neis.go.kr/hub/mealServiceDietInfo?Type=json&pIndex=1&pSize=1&ATPT_OFCDC_SC_CODE=B10&SD_SCHUL_CODE=7010537&MLSV_YMD="+tomorrowDate+"&KEY=b59b0495fbd2464ca7b0250bc360e0e2"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default,headers: [:]).responseJSON{
            response in
            switch response.result {
            case .success(let value):
                let json : JSON = JSON(value)
                if json["mealServiceDietInfo"].exists(){
                    let meal = json["mealServiceDietInfo"].arrayValue[1]
                    let row = meal["row"].arrayValue[0]
                    let ddishNm = row["DDISH_NM"].stringValue
                    let lunchString = ddishNm.replacingOccurrences(of: "<br/>", with: "\n")
                    let removeNumberString : String = lunchString.components(separatedBy: CharacterSet.decimalDigits).joined()
                    let removeDotString : String = removeNumberString.replacingOccurrences(of: ".", with: "")
                    self.tomorrowLabel.text = removeDotString
                }else{
                    self.tomorrowLabel.text = "내일은 급식이 없습니다"
                }
            default:
                return
            }
        }
    }
    

}
