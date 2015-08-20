//
//  CountryViewController.swift
//  StatePickerSwift
//
//  Created by Manuel Meyer on 20.08.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            setUpTableViewIfReady()
        }
    }
    var countries: [[String : AnyObject]]?{
        didSet{
            setUpTableViewIfReady()
        }
    }

    var didPickCountryAndState: ((country:String, state:String) -> Void)?

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let c = countries![indexPath.row] as [String : AnyObject]
        cell.textLabel?.text = c["name"] as? String
        return cell
    }
    

    func setUpTableViewIfReady(){
        if let tableView = self.tableView, countries = self.countries{
            tableView.dataSource = self;
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if let cell = sender as? UITableViewCell, vc = segue.destinationViewController as? StatePickerViewController{
            
            let indexPath = tableView.indexPathForCell(cell)!
            let c = countries![indexPath.row] as [String : AnyObject]
            let s = c["states"] as! [String]
            vc.states = s
            vc.countryName = c["name"] as? String
            vc.didPickCountryAndState = self.didPickCountryAndState
        }
    }
}
