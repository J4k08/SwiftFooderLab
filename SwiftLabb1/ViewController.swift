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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        searchButton.layer.borderWidth = 1.0
        searchButton.layer.cornerRadius = 5.0
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.backgroundColor = .clear
    
    }

    @IBAction func search(_ sender: Any) {
        
        searchQuery(searchField: searchField.text!, returnedJsonObjects : recievedArray)
    }
    
    func recievedArray(array : [[String:Any]]){
        
        unfilteredJson = array
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "next", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vC = segue.destination as! TableViewController
        vC.jsonArray = unfilteredJson
    }
}
