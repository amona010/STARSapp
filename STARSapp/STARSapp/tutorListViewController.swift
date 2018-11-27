//
//  tutorListViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/26/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import Foundation
import UIKit


class tutorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tutorTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tutorTable.delegate = self
        self.tutorTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tutorCell", for: indexPath)
        return cell
    }
    
}
