//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 2654199, 4199402
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//

import UIKit

class filterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var classTable: UITableView?
    @IBOutlet var skillTable: UITableView?
    @IBOutlet var availabiltyTable: UITableView?
    
    var data = modelData.getSome
    
    //Set table sources and delegates to that of the controller on load
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
    
    //When the filter view disappears, update the data to be displayed in the tutor table
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        data.returnClass()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == classTable)
        {
            return data.checkClasses.count
        }
        else if(tableView == skillTable)
        {
            return data.checkSkills.count
        }
        else
        {
            return data.checkAvailability.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == classTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as!filterClassesCell
            cell.label?.text = Array(data.checkClasses.keys)[indexPath.row]
            cell.active?.isOn = Array(data.checkClasses.values)[indexPath.row]
            
            return cell
        }
        else if(tableView == skillTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as!filterSkillsCell
            cell.label?.text = Array(data.checkSkills.keys)[indexPath.row]
            cell.active?.isOn = Array(data.checkSkills.values)[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "availabilityCell", for: indexPath) as! filterAvailabilityCell
            cell.label?.text = Array(data.checkAvailability.keys)[indexPath.row]
            cell.active?.isOn = Array(data.checkAvailability.values)[indexPath.row]
            
            return cell
        }
    }
}
