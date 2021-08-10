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
    
    @IBAction func searchInitiated(_ sender: UIButton) {
        print("Search initiated for \(citySearch.text ?? "empty yet")")
        
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citySearch.delegate = self
        // Do any additional setup after loading the view.
    }


}

