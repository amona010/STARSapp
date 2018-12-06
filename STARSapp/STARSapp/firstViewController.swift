//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 2654199, 4199402
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//

import UIKit
import CoreData

class firstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    
    // Context where Appointment objects are saved, not used in this class, but reference of context sent through segue to other controllers.
    var managedObjectContext: NSManagedObjectContext? = nil
    
    let data = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        passWord.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    Performs a login check before segueing into the application.
    If incorrect returns false and an alert is shown
     */
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if data.isName(access: userName.text!) &&
            data.isPass(access: passWord.text!)
        {
            return true
        }
        else{
            let alert = UIAlertController(title: "Incorrect Login", message: "Incorrect Login. Please try again. ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            userName.text = ""
            passWord.text = ""
            
        }
        
        return false
    }
    
    // When Login button is pressed, the persistant container's context is given to the appropriate view controllers for further use. 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTab" {
            let tab = segue.destination as! UITabBarController
            let vc1 = tab.viewControllers?[2] as! appointmentsTableViewController
            
            vc1.managedObjectContext = self.managedObjectContext
            
            let vc2 = tab.viewControllers?[0].childViewControllers[0] as! tutorListViewController
            vc2.managedObjectContext = self.managedObjectContext
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        UIView.animate(withDuration: 0.1) {
            self.view.frame.origin.y -= 150
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        UIView.animate(withDuration: 0.1) {
            self.view.frame.origin.y += 150
        }
    }
    
    
}

