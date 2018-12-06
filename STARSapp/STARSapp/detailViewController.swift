//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 4199402,
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//

import UIKit
import MessageUI
import CoreData

class detailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate
{
    var array1 = [String]()
    var array2 = [String]()
    
    //Variables to fill text fields on 'viewwillappear'
    var name = ""
    var grade = ""
    var email = ""
    var schedule = ""
    var availability = ""
    var phone = ""
    var data = modelData.getSome
    
    // Context where Appointment objects are saved
    var managedObjectContext: NSManagedObjectContext? = nil
    
    @IBOutlet var classTableView: UITableView?
    @IBOutlet var skillTableView: UITableView?
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var gradeTextField: UITextField?
    @IBOutlet var emailTextField: UITextField?
    @IBOutlet var scheduleTextField: UITextField?
    
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
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        nameTextField?.text = name
        gradeTextField?.text = grade
        emailTextField?.text = email
        scheduleTextField?.text = schedule
        
    }
    
    // Function for adding objects into context
    func insertNewObject() {
        let context = self.managedObjectContext
        context?.perform {
            let appt = Appointment(context: context!)
            
            appt.schedule = self.schedule
            appt.tutorName = self.name
            
            context?.insert(appt)
        }
        do {
            try context?.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    //Function which creates an alert to validate wether or not the user wants to make an appointment with
    //the tutor of their choosing
    @IBAction func makeAppointment()
    {
        
        //Alert to be displayed
        var alert = UIAlertController()
        
        //If model data states that tutor is available
        if(availability == "Available")
        {
            //Alert notifies user that this is the case
            alert = UIAlertController(title: "Schedule appointment with " + name + "?", message: "This tutor is available!", preferredStyle: .alert)
        }
        else
        {
            //If not, the alert says otherwise
            alert = UIAlertController(title: "Schedule appointment with " + name + "?", message: "This tutor is not available!", preferredStyle: .alert)
        }
        
        //Add action that schedules an appointment by text when the use says 'yes'
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            //Saves object to the applications's context 
            self.insertNewObject()
            
            //Checks to see if the device is capable of using iMessage
            if(MFMessageComposeViewController.canSendText())
            {
                //Creates a viewcontroller which handles a modal view that handles iMessage texts
                let message = MFMessageComposeViewController()
                //Create custom text
                message.body = "Hello " + self.name + ". My name is " + self.data.profileName + " and I would like to meet with you during your office hours: " + self.schedule
                //Set recipient to tutor phone number (given in model class)
                message.recipients = [self.phone]
                message.messageComposeDelegate = self
                //Present iMessage
                self.present(message, animated: true, completion: nil)
            }
        }))
        
        //This action lets the user cancel
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("No")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Handles tableView functionality for all tables in detail view controller
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //Based on the ID of the tableview, correct value is returned
        if(tableView == classTableView)
        {
            return array1.count
        }
        else
        {
            return array2.count
        }
    }
    
    //Handles tableView functionality for all tables in detail view controller
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Based on the ID of the tableview, correct value is returned
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
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
}
