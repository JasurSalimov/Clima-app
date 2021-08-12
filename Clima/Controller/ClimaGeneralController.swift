//
//  ViewController.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

class ClimaGeneralController: UIViewController, UITextFieldDelegate {
    
    var climaBrain = WeatherBrain()
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
    
    func didUpdateWeather(weather: WeatherModel){
        sleep(1)
        print(weather.temperature)
        print(weather.name)
        print(weather.weatherCondition)
        //cityLabel.text = weather.name
       // temperatureLabel.text = weather.temperatureString
        //conditionImageView.image = UIImage(systemName: "\(weather.weatherCondition)")
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        citySearch.endEditing(true)
        citySearch.resignFirstResponder()
       
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearch.delegate = self
        climaBrain.delegate = self
       
        
    }
    
    
}

