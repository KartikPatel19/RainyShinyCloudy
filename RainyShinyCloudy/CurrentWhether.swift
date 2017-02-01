//
//  CurrentWhether.swift
//  RainyShinyCloudy
//
//  Created by kartik on 1/29/17.
//  Copyright © 2017 kartik. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWhether{
    var _cityName: String!
    var _date: String!
    var _whetherTyper: String!
    var _currentTemp: Double!
    let currentWheatherURL = URL(string: CURRENT_WHETHER_URL)!
    
    var cityName: String{
        if _cityName==nil {
            _cityName=""
        }
        return _cityName
    }
    var whetherTyper: String{
        if _whetherTyper==nil{
            _whetherTyper=""
        }
        return _whetherTyper
    }
    var currentTemp: Double{
        if _currentTemp==nil{
            _currentTemp=0.0
        }
        return _currentTemp
    }
    
    var date: String{
        if _date==nil{
            _date=""
        }
        
        let dateFormetter=DateFormatter()
        dateFormetter.dateStyle = .long
        dateFormetter.timeStyle = .none
        let currentDate = dateFormetter.string(from: Date())
        self._date="Today,\(currentDate)"
        return _date
    }

    func downloadWheatherDetails(completed:  @escaping DownloadComplete){
        
        Alamofire.request(currentWheatherURL).responseJSON { responce in
            let result = responce.result
            
            if let dict=result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName=name.capitalized
                    
                }
                if let weather = dict["weather"]as?[Dictionary<String,AnyObject>]{
                if let main = weather[0]["main"] as? String{
                    self._whetherTyper=main.capitalized
                    
                }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    
                    if let nowTemp = main["temp"] as? Double{
                        let kelvinToFerenhitPreDivision = (nowTemp * (9/5) - 459.67)
                        let kelvinToFarenhit = Double(round(10 * kelvinToFerenhitPreDivision/10))
                        self._currentTemp=kelvinToFarenhit
                        
                    }
                }
            }
            
        }
        completed()
    }
}
