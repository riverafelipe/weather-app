//
//  ViewController.swift
//  Weather App
//
//  Created by Felipe Rivera on 4/26/16.
//  Copyright © 2016 Felipe Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    
    @IBAction func searchButton(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Segue to send the textField into the SecondViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "searchSegue") {
            let svc = segue.destinationViewController as! SecondViewController;
            
            svc.city = textField.text!
            
        }
    }
}

