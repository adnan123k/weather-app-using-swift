//
//  Dec.swift
//  Clima
//
//  Created by adnan alkharfan on 13/07/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct w1w1 : Codable{
    let main:Main
    let weather:[W]
    
    let name:String
    
    
    
}

struct Main:Codable {
  var  temp:Float
}

struct W:Codable {
    var id:Int
}
