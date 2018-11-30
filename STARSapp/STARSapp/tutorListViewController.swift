//
//  tutorListViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/26/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

// UITableViewDelegate, UITableViewDataSource
class tutorListViewController: UITableViewController{
    
    let tutorData = modelData.getSome
    var useThisData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return useThisData.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tutorCell", for: indexPath)
        
        
        let tutorName = useThisData[indexPath.row][0].description
        
        cell.textLabel?.text = tutorName
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        useThisData = tutorData.setDataToReturn() as! [[String]]
       tableView.reloadData()
    }
    
}

