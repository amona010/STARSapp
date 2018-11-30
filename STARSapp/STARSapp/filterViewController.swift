//
//  filterViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/29/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

class filterViewController: UIViewController
{
    
    @IBOutlet var switches: [UISwitch]!
    
    let tutorData = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for switsh in switches{
            if !switsh.isOn
            {
                tutorData.checkDefault.removeValue(forKey: switsh.tag)
            }
        }
        
        tutorData.returnClass()
    }
    
}
