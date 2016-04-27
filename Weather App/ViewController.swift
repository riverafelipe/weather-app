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
        
        
        //User inputs city to search for weather forecast of 1-3 days
        let url = NSURL(string: "http://www.weather-forecast.com/locations/\(city)/forecasts/latest")!
        
        
        //Fetches data from url
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            //Checks if data is recieved for safety of not crashing
            if let urlContent = data {
                
                //Converts data into html format
                let webContent = NSString(data: urlContent , encoding: NSUTF8StringEncoding )
                
                
                //Splits the first half of html into two strings in arrays. The first element in array contains junk html. The second is the staring point of Weather Forecast summary but it has attached the rest of junk html.
                let splitHtmlToStaringPoint = webContent?.componentsSeparatedByString("1 &ndash; 3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                //Start Point of Weather Summary with junk html attached to the end
                let startPoint = splitHtmlToStaringPoint![1]
                
                //Splits the second half of html into two strings in array. The first element in array contains the weather summary. The second element is junk html
                let splitHtmlToEndPoint = NSString(string: startPoint).componentsSeparatedByString("</span>")
                
                let weatherSummary = splitHtmlToEndPoint[0]
                
                print(weatherSummary)
                
                
                
                
                
            }
            
        }
        
        
        task.resume()
        
        
        
        
        
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

