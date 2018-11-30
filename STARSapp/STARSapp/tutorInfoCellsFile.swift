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
    var data = modelData.getSome
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            data.checkClasses.updateValue(true, forKey: (label?.text)!)
        }
        else
        {
            data.checkClasses.updateValue(false, forKey: (label?.text)!)
        }
    }
}

class filterSkillsCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
    @IBOutlet var active: UISwitch?
    var data = modelData.getSome
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            data.checkSkills.updateValue(true, forKey: (label?.text)!)
        }
        else
        {
            data.checkSkills.updateValue(false, forKey: (label?.text)!)
        }
    }
}

class filterAvailabilityCell: UITableViewCell
{
    @IBOutlet var label: UILabel?
    @IBOutlet var active: UISwitch?
    var data = modelData.getSome
    
    @IBAction func switched(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            data.checkAvailability.updateValue(true, forKey: (label?.text)!)
        }
        else
        {
            data.checkAvailability.updateValue(false, forKey: (label?.text)!)
        }
    }
}
