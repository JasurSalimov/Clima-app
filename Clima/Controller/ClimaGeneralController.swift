//
//  ViewController.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

class ClimaGeneralController: UIViewController, UITextFieldDelegate {
    
    var newWeatherManager = ClimaBrain()
    @IBOutlet weak var citySearch: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    var goTwice = 0  
    @IBAction func searchInitiated(_ sender: UIButton) {
        citySearch.endEditing(true)
        print("Search initiated for \(citySearch.text ?? "empty yet")")
 
        
        
        
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
            
            newWeatherManager.addWeatherCity(cityName: cityName)
            
        }
        else{
            
        }
        
        citySearch.text = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        citySearch.endEditing(true)
        print("Search initiated for \(citySearch.text ?? "empty yet")")
        citySearch.resignFirstResponder()
        
        
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearch.delegate = self
        
    }


}

