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
    @IBOutlet weak var searchButton: UIButton!
    var color = UIColor(red: 3, green: 122, blue: 255)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.layer.borderWidth = 1.0
        searchButton.layer.cornerRadius = 2.0
        searchButton.layer.borderColor = color.cgColor
        searchButton.backgroundColor = UIColor.white
    
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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
