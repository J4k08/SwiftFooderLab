//
//  File.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-20.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import Foundation

func searchQuery(searchField : String, returnedJsonObjects : @escaping ([[String:Any]]) -> Void) {
    
    let urlString = "http://matapi.se/foodstuff?query=\(searchField)&format=json&pretty=1"
    if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: safeUrlString) {
        
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request)
        { (data: Data?, respone: URLResponse?, error: Error?) in
            
            if let actualData = data {
                let jsonOptions = JSONSerialization.ReadingOptions()
                do {
                    
                    if let foods = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String: Any]]  {
                        
                        DispatchQueue.main.async {
                            
                            returnedJsonObjects(foods)
                        }
                        
                    }else {
                        NSLog("Failed to cast from json")
                    }
                }
                catch let parseError {
                    NSLog("Failed to parse json: \(parseError)")
                }
            }else {
                NSLog("No data recieved :´(")
            }
            
        }
        task.resume()
        
    } else {
        NSLog ("Failed to create url :(")
    }
}
