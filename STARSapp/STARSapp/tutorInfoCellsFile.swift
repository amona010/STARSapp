//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 2654199, 4199402
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//
//  This file contains the various classes which represent the different tableview cells in the application

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
