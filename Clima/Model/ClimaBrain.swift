//
//  ClimaBrain.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

class ClimaBrain: UIViewController{
    var name: String = ""
    var temp: Double = 0.0
    var weatherID: Int = 0
    var weatherPicture: String = ""
    
    
    var weatherURL =  "hidden"
    
    func addWeatherCity(cityName: String){
        
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("\(weatherURL)&q=\(cityName)")
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
                    self.parseJSON(weatherData: safeData)
                    
                    
                }
            }
            //4 Start the task
            task.resume()
        }
    }
    
   func parseJSON(weatherData: Data){
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            /*
            self.city = decodedData.name
            self.temperature = decodedData.main.temp
            self.description = decodedData.weather[0].description
            */
            name = decodedData.name
            print(name)
            temp = decodedData.main.temp
            weatherID = decodedData.weather[0].id
           
            switch weatherID {
            case 200...232:
                weatherPicture = "cloud.bolt"
                break;
            case 300...321:
                weatherPicture = "cloud.drizzle"
                break;
            case 500...531:
                weatherPicture = "cloud.rain"
                break;
            case 600...622:
                weatherPicture = "cloud.snow"
                break;
            case 800:
                weatherPicture = "sun.max"
                break;
            case 801...804:
                weatherPicture = "cloud"
                break;
            default:
                break;
            }
            
          
        }catch{
            print("error")
        }
    }
    
    
    
   
    
    
}
