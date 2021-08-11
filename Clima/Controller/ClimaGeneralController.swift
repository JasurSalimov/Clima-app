//
//  ViewController.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

class ClimaGeneralController:  ClimaBrain, UITextFieldDelegate {
    
    var climaBrain = ClimaBrain()
    @IBOutlet weak var citySearch: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    var goTwice = 0
    
    @IBAction func searchInitiated(_ sender: UIButton) {
        citySearch.endEditing(true)
        
        
        
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if (citySearch.text != ""){
            return true
            
        }
        else{
            citySearch.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        citySearch.endEditing(true)
        if let cityName = citySearch.text{
            
            climaBrain.addWeatherCity(cityName: cityName)
            
           
            
        }
        else{
            
        }
        
        citySearch.text = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        citySearch.endEditing(true)
        citySearch.resignFirstResponder()
        sleep(1)
        cityLabel.text = climaBrain.name
        temperatureLabel.text = String(climaBrain.temp)
        conditionImageView.image = UIImage(systemName: "\(climaBrain.weatherPicture)")
    
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearch.delegate = self
       
        
    }
    
    
}

