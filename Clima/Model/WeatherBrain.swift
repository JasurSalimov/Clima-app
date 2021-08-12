//
//  ClimaBrain.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

protocol WeatherBrainDelegate{
    func didUpdateWeather(_ weatherBrain: WeatherBrain, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherBrain{
    var weatherURL = ""
    var delegate: ClimaGeneralController?
    
    mutating func addWeatherCity(cityName: String){
        self.weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=0bd52a13e020af4ed3268f85e454b171&units=metric&&"
        var urlString = "\(weatherURL)&q=\(cityName)"
        print("\(weatherURL)&q=\(cityName)")
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        performRequest(with: urlString)
        
    }
    func performRequest(with urlString: String){
        
        //1. create a URL
        if let url = URL(string: urlString){
            //2. URL session
            let session = URLSession(configuration: .default)
            //3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: Error.self as! Error)
                    return
                }
                if let safeData = data{
                   if let weather = self.parseJSON(safeData) {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                    
                }
            }
            //4 Start the task
            task.resume()
        }
    }
    // Decoding the code which arrived as JSON and transferring to WeatherModel Structure
   func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherModel = WeatherModel(n: decodedData.name, t: decodedData.main.temp, wCI: decodedData.weather[0].id)
            return weatherModel
        }catch{
            self.delegate?.didFailWithError(error: Error.self as! Error)
            
            print("error")
            return nil
        }
    }
    
    mutating func initialWeatherData(latitude: Double, longitude: Double){
        print(latitude)
        print(longitude)
        self.weatherURL =  "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=0bd52a13e020af4ed3268f85e454b171&units=metric&&"
        print(weatherURL)
        var urlString = weatherURL
        performRequest(with: urlString)
    }
    
   
    
    
}
