//
//  ViewController.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit
import CoreLocation

class ClimaGeneralController: UIViewController{
    let locationManager = CLLocationManager()
    var climaBrain = WeatherBrain()
    @IBOutlet weak var citySearch: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    var goTwice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = ("\(cityLabel.text!) \t")
        citySearch.delegate = self
        climaBrain.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate
extension ClimaGeneralController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        citySearch.endEditing(true)
        citySearch.resignFirstResponder()
        
        return true
    }
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
        
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
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
        let cityName = citySearch.text
        if cityName != nil{
            climaBrain.addWeatherCity(cityName: cityName ?? "Tashkent")
        }
        else{
            
        }
        citySearch.text = ""
    }
    
}
//MARK: - WeatherBraingDelegate
extension ClimaGeneralController: WeatherBrainDelegate{
    func didUpdateWeather(_ weatherBrain: WeatherBrain, weather: WeatherModel){
        sleep(1)
        
        DispatchQueue.main.async{
            self.cityLabel.text = ("\(weather.name) \t")
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: "\(weather.weatherCondition)")
        }
        
        
        
    }
    func didFailWithError(error: Error){
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension ClimaGeneralController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            climaBrain.initialWeatherData(latitude: lat, longitude: lon)
        }
        
        
        
        
    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error){
        print("Something is off \n \(error)\n ")
    }
    
    
}

