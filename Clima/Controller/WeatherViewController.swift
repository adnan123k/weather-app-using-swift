//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

import CoreLocation

class WeatherViewController: UIViewController,UITextFieldDelegate,UiConneter,CLLocationManagerDelegate {
    func onFail(_ e:String) {
        print(e)
    }
    let c=CLLocationManager()
    
    let w=WeatherM()

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchbar: UITextField!
    @IBAction func search(_ sender: UIButton) {
        searchbar.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        w.delegate=self
        searchbar.delegate=self
        c.requestWhenInUseAuthorization()
        c.delegate=self
        c.requestLocation()
        
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
        self.w.fetch1(locations.last!.coordinate.latitude,locations.last!.coordinate.longitude)
    }
    @IBAction func currentLocationButton(_ sender: Any) {
        c.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("shit")
        print(error)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        w.fetch(searchbar.text!)
        searchbar.text=""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchbar.text != ""{
            return true}
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchbar.endEditing(true)
        return true
    }

    func didget(_ W:Eat){
        DispatchQueue.main.async {
            self.temperatureLabel.text=String(format: "%.1f",W.temp)
            self.conditionImageView.image=UIImage(systemName: W.state)
            self.cityLabel.text=W.name
            
        }
        
       
        
    }
    
}

