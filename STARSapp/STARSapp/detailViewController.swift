//
//  tutorInfoViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/28/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var array1 = ["COP3342", "COP2244", "ENC2291"]
    var array2 = ["Unity", "Swift", "Java"]
    
    @IBOutlet var classTableView: UITableView?
    @IBOutlet var skillTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.classTableView?.delegate = self
        self.classTableView?.dataSource = self
        self.skillTableView?.delegate = self
        self.skillTableView?.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == classTableView)
        {
            return array1.count
        }
        else
        {
            return array2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == classTableView)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as!tutorClassesCell
            cell.label?.text = array1[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as!tutorSkillsCell
            cell.label?.text = array2[indexPath.row]
            
            return cell
        }
    }
}
