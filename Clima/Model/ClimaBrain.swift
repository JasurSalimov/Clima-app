//
//  ClimaBrain.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import Foundation

struct ClimaBrain{
    
     var weatherURL = 
    
    func addWeatherCity(cityName: String){
        
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
    
    
    
    
}
