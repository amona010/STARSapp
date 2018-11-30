//
//  ViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/25/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var pass: UITextField!
    
    let loginData = modelData.getSome
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
}

