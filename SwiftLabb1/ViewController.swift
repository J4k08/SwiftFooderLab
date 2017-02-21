//
//  ViewController.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-19.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stuff: [Any] = []
    var search: String = ""
    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: self)
        search = searchField.text!
        stuff = searchQuery(searchField: search)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

