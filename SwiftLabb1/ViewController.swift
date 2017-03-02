//
//  ViewController.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-19.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var unfilteredJson: [[String:Any]] = []
    var favoriteFoods: [String:Any] = [:]
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var showFavorites: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        searchButton.layer.borderWidth = 1.0
        searchButton.layer.cornerRadius = 5.0
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.backgroundColor = .clear
        
        showFavorites.layer.borderWidth = 1.0
        showFavorites.layer.cornerRadius = 5.0
        showFavorites.layer.borderColor = UIColor.black.cgColor
        showFavorites.backgroundColor = .clear
    
    }

    @IBAction func search(_ sender: Any) {
        
        searchQuery(searchField: searchField.text!, returnedJsonObjects : recievedArray)
    }
    
    
    @IBAction func clickedFavorites(_ sender: Any) {
        
        let array = UserDefaults.standard.array(forKey: "savedWares") as? [Int]
            
        for i in array! {
            
            searchQueryForNutrition(number: array![i], gotNutritionData: recievedFavorite)
            
        }
        
        self.performSegue(withIdentifier: "next", sender: self)
    }
    
    func recievedFavorite(dictionary : [String:Any]) {
        
        favoriteFoods["name"] = dictionary["name"] as? String
        favoriteFoods["number"] = dictionary["number"] as? Int
    }
    
        
    
    func recievedArray(array : [[String:Any]]){
        
        unfilteredJson = array
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "next", sender: self)
        }
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vC = segue.destination as! TableViewController
        vC.sentArray = unfilteredJson
    }
}
