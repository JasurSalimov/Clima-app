//
//  WeatherData.swift
//  Clima
//
//  Created by Jasur Salimov on 8/11/21.
//

import Foundation

struct WeatherData: Codable{
    
    let name: String
    let main: Main
    let weather: [Weather]
    
    
    
    
}
struct Weather: Codable{
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

struct Main: Codable{
    let temp: Double
    
}




