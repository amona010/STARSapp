//
//  tutorInfoCellsFile.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/28/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit

class tutorClassesCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
}

class tutorSkillsCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
}

class filterClassesCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
    @IBOutlet var active: UISwitch?
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            print(#function)
        }
        else
        {
            print(#function + " off")
        }
    }
}

class filterSkillsCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
    @IBOutlet var active: UISwitch?
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            print(#function)
        }
        else
        {
            print(#function + " off")
        }
    }
}

class filterAvailabilityCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
    @IBOutlet var active: UISwitch?
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            print(#function)
        }
        else
        {
            print(#function + " off")
        }
    }
}
