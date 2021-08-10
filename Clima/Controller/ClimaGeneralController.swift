//
//  ViewController.swift
//  Clima
//
//  Created by Jasur Salimov on 8/10/21.
//

import UIKit

class ClimaGeneralController: UIViewController, UITextFieldDelegate {
    
    
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
        citySearch.text = ""
        citySearch.endEditing(true)
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

