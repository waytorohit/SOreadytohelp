//
//  ViewController.swift
//  SOreadytohelp
//
//  Created by Etelligens-M on 04/08/18.
//  Copyright © 2018 Etelligens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
         let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case"
        
         guard let urlString = URL(string: jsonUrlString) else { return}
        
        URLSession.shared.dataTask(with: urlString) {
            (data, response, error) in
            
            guard let data = data else {return}
           
            do {
                
                    let course = try
                    JSONDecoder().decode(Course.self, from: data)
                    print(course.name)
                
            } catch let jsonErr {
                print("json serializing error:", jsonErr)
            }
            
        }.resume()
    }

   

}

// Create struct
struct Course: Codable {
    
    let id: Int
    let name: String
    let link: String
    let imageToUrl: String
    

}

