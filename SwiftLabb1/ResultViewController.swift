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
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbs: UILabel!
    
    @IBOutlet weak var nameOfWareTitle: UINavigationItem!
    var recievedString : String?
    var numberOfWare : Int?
    var nutritionData : [String : Any] = [:]
    var nutrientValues : [String: Float] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchQueryForNutrition(number: numberOfWare!, gotNutritionData: recievedData)
        
        nameOfWareTitle.title = recievedString
        
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
        if let fatValue = nutrientValues["fat"] {
            fat.text = "Fett: \(fatValue)"
        }
        if let carbsValue = nutrientValues["carbohydrates"] {
            carbs.text = "Kolhydrater: \(carbsValue)"
        }
        
        if(calculatedNutrientValue() > 20) {
            print(calculatedNutrientValue())
            
        }
         else if(calculatedNutrientValue() > 40) {
            print(calculatedNutrientValue())
        }
        else if(calculatedNutrientValue() > 60) {
            print(calculatedNutrientValue())
        }
        else if(calculatedNutrientValue() > 80) {
            print(calculatedNutrientValue())
        }
        else if(calculatedNutrientValue() > 120) {
            print(calculatedNutrientValue())
        }
        
    }
    
    func calculatedNutrientValue() -> Double{
        
        
        let fatValue = nutrientValues["fat"]
        let carbsValue = nutrientValues["carbohydrates"]
        
        let totalNutritionValue = Double(fatValue!) + Double(carbsValue!)
        
        return totalNutritionValue
    }

}
