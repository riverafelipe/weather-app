//
//  SecondViewController.swift
//  Weather App
//
//  Created by Felipe Rivera on 4/26/16.
//  Copyright © 2016 Felipe Rivera. All rights reserved.

//
import UIKit

class SecondViewController: UIViewController {
    
    // This string is the segue of the textField in the firstViewController
    var city = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var cityArray = city.componentsSeparatedByString(" ")
        
        if city.containsString(" ") {
            
            print("\(cityArray[0])-\(cityArray[1])")
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

