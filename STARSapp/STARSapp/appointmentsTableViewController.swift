//
//  appointmentsTableViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 12/4/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import Foundation
import UIKit


class appointmentsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var appointmentTable: UITableView!
    
    var data = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appointmentTable.delegate = self
        self.appointmentTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
