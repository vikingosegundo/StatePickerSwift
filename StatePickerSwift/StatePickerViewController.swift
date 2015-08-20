//
//  StatePickerViewController.swift
//  StatePickerSwift
//
//  Created by Manuel Meyer on 20.08.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

import UIKit

class StatePickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            setUpTableViewIfReady()
        }
    }
    
    var countryName:String?{
        didSet{
            setUpTableViewIfReady()
        }
    }
    
    var states: [String]?{
        didSet{
            setUpTableViewIfReady()
        }
    }
    
    var didPickCountryAndState: ((country:String, state:String) -> Void)?
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = states![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let state = states![indexPath.row]
        self.didPickCountryAndState?(country: countryName!, state: state)
    }
    
    func setUpTableViewIfReady(){
        if let tableView = self.tableView, countries = self.states, countryName = self.countryName{
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
}
