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
    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vC = segue.destination as! TableViewController
        vC.sentArray = unfilteredJson
    }


}

