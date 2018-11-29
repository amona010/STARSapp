//
//  filterViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/29/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

class filterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var classTable: UITableView?
    @IBOutlet var skillTable: UITableView?
    @IBOutlet var availabiltyTable: UITableView?
    
    var array1 = ["COP3342", "COP2244", "ENC2291"]
    var array2 = ["Unity", "Swift", "Java"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        classTable?.delegate = self
        classTable?.dataSource = self
        skillTable?.delegate = self
        skillTable?.dataSource = self
        availabiltyTable?.delegate = self
        availabiltyTable?.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == classTable)
        {
            return array1.count
        }
        else if(tableView == skillTable)
        {
            return array2.count
        }
        else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == classTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as!filterClassesCell
            cell.label?.text = array1[indexPath.row]
            cell.active?.isOn = true
            
            return cell
        }
        else if(tableView == skillTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as!filterSkillsCell
            cell.label?.text = array2[indexPath.row]
            cell.active?.isOn = true
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "availabilityCell", for: indexPath) as! filterAvailabilityCell
            cell.label?.text = "Availabile?"
            cell.active?.isOn = true
            
            return cell
        }
    }
}
