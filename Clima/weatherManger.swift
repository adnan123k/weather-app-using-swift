//
//  weatherManger.swift
//  Clima
//
//  Created by adnan alkharfan on 13/07/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol UiConneter {
    func didget(_ W:Eat)
    func onFail(_ e:String)
}

class WeatherM {
    
    var delegate:UiConneter?
    
    let url="https://api.openweathermap.org/data/2.5/weather?units=metric&appid=fcb80db3b2180d2cd9cc191278bf70cb"
    
 public   func fetch(_ q:String){
        
    let connect=URL(string:"\(url)&q=\(q)")
        let session=URLSession(configuration: .default)

    if connect != nil
    {        let task=session.dataTask(with: connect!) { (Data, Res, Error) in
            if Error != nil{
                self.delegate?.onFail(Error!.localizedDescription)
            return
            }
            guard let httpResponse = Res as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                self.delegate?.onFail("Error with the response, unexpected status code: \(String(describing: Res))")
                   return
                 }
            if Data != nil{
                let jason = JSONDecoder()
                do{
                  
                    let result = try jason.decode(w1w1.self, from: Data! )
                  
                  
                    let W =  Eat ( result.main.temp , result.weather[0].id ,q)
                    self.delegate?.didget( W)
                }catch{
                    self.delegate?.onFail("error in json")
                    return
                }
                
            }
        }
        
    task.resume()}
        
    }
    
    func fetch1(_ q:Double,_ log:Double){
           
       let connect=URL(string:"\(url)&lat=\(q)&lon=\(log)")
           let session=URLSession(configuration: .default)

       if connect != nil
       {        let task=session.dataTask(with: connect!) { (Data, Res, Error) in
               if Error != nil{
                   self.delegate?.onFail(Error!.localizedDescription)
               return
               }
               guard let httpResponse = Res as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                   self.delegate?.onFail("Error with the response, unexpected status code: \(String(describing: Res))")
                      return
                    }
               if Data != nil{
                   let jason = JSONDecoder()
                   do{
                     
                       let result = try jason.decode(w1w1.self, from: Data! )
                     
                     
                    let W =  Eat ( result.main.temp , result.weather[0].id ,result.name)
                       self.delegate?.didget( W)
                   }catch{
                       self.delegate?.onFail("error in json")
                       return
                   }
                   
               }
           }
           
       task.resume()}
           
       }
}
