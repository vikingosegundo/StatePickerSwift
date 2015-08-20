//
//  ViewController.swift
//  StatePickerSwift
//
//  Created by Manuel Meyer on 20.08.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryStateLabel: UILabel!{
        didSet{
            countryStateLabel.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if segue.identifier == "selectCountry"{
            if let vc = segue.destinationViewController as? CountryViewController{
            
                vc.countries = [
                    ["name": "United States", "states": ["New York", "Alabama"]],
                    ["name": "Germany", "states": ["Berlin", "Hamburg"]]
                ]
                
                vc.didPickCountryAndState = {
                    (country, state) in
                    self.countryStateLabel.text = "\(country), \(state)"
                }
            
            }
        }
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue){
        
    }
}

