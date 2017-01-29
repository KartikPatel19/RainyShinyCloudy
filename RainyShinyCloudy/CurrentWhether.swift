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

    
    
    
}
