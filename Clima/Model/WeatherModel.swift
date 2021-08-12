//
//  WeatherModel.swift
//  Clima
//
//  Created by Jasur Salimov on 8/12/21.
//

import Foundation

struct WeatherModel{
    var name: String
    var temperature: Double
    var temperatureString: String?
    var weatherConditionId: Int
    
    init(n: String, t: Double, wCI: Int){
        self.temperature = t
        self.name = n
        self.weatherConditionId = wCI
    }
    
    mutating func tempToString(){
        self.temperatureString = String(round(10*temperature)/10)
        if temperatureString != nil{
            temperatureString = temperatureString!
        }
    }
    var weatherCondition: String{
        switch weatherConditionId {
        case 200...232:
            return "cloud.bolt" // we are deleting break statements since
        case 300...321:         // return works similarly it breaks the switch statement when executes
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "sun.max"
        }
    }
    
    
    
    
    
    
    
    
    
    
}
