//
//  ClimaBrain.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

protocol WeatherBrainDelegate{
    func didUpdateWeather(weather: Weather)
}


struct WeatherBrain{
    var weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=0bd52a13e020af4ed3268f85e454b171&units=metric&&"
    var delegate: ClimaGeneralController?
    func addWeatherCity(cityName: String){
        var urlString = "\(weatherURL)&q=\(cityName)"
        print("\(weatherURL)&q=\(cityName)")
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        performRequest(urlString: urlString)
        
    }
    func performRequest(urlString: String){
        
        //1. create a URL
        if let url = URL(string: urlString){
            //2. URL session
            let session = URLSession(configuration: .default)
            //3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                    return
                }
                if let safeData = data{
                   if let weather = self.parseJSON(weatherData: safeData) {
                    self.delegate?.didUpdateWeather(weather: weather)
                        
                    }
                    
                }
            }
            //4 Start the task
            task.resume()
        }
    }
    // Decoding the code which arrived as JSON and transferring to WeatherModel Structure
   func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherModel = WeatherModel(n: decodedData.name, t: decodedData.main.temp, wCI: decodedData.weather[0].id)
            print(weatherModel.weatherCondition)
            return weatherModel
        }catch{
            print("error")
            return nil
        }
    }
    
    
    
   
    
    
}
