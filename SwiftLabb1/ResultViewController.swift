//
//  ResultViewController.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-19.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbs: UILabel!
    
    var recievedString : String?
    var numberOfWare : Int?
    var nutritionData : [String : Any] = [:]
    var nutrientValues : [String: Float] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        searchQueryForNutrition(number: numberOfWare!, gotNutritionData: recievedData)
        
        result.text = recievedString
        
        
        
    }
    
    func recievedData(dictionary : [String:Any]) {
        
        
        nutritionData = dictionary
        
        nutrientValues = (nutritionData["nutrientValues"] as? [String:Float])!
        
        setValues(dictionay: nutrientValues)
    }
    
    func setValues(dictionay : [String:Float]) {
        
        if let energyKcalValue = nutrientValues["energyKcal"] {
            calories.text = "Kalorier: \(energyKcalValue)"
        }
        if let proteinValue = nutrientValues["protein"] {
            protein.text = "Protein: \(proteinValue)"
        }
        if let fatValue = nutrientValues["protein"] {
            fat.text = "Fett: \(fatValue)"
        }
        if let carbsValue = nutrientValues["fat"] {
            carbs.text = "Kalorier: \(carbsValue)"
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
