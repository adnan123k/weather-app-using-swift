//
//  Weather.swift
//  Clima
//
//  Created by adnan alkharfan on 13/07/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

class Eat {
    var temp:Float
    var id:Int
    var name:String
    var state:String{
        switch id{
        case 200...232:
        
            return "cloud.bolt"
            
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "smoke"
        case 800:
            return "sun.max"
        case 801...804:
           return "cloud"
            
            
        default:
          
            break
        }
      return ""
    }
    init(_ t:Float,_ i:Int,_ s:String) {
        temp=t
        id=i
        name=s
    }
}
