//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 2654199, 4199402
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//

import Foundation
import UIKit
import CoreData

//Custom tableView cell class
class tutorAppointmentCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var apptLabel: UILabel!
}

class appointmentsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    // Context where Appointment objects are saved
    var managedObjectContext: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Custom fetchResultsController built into the class
    var fetchedResultsController: NSFetchedResultsController<Appointment> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "tutorName", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    // The fetch controller that is used for instantiation
    var _fetchedResultsController: NSFetchedResultsController<Appointment>? = nil
    
    // Return numbers of items in the context for the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    // Returns format of each cell in the tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! tutorAppointmentCell
        let appt = fetchedResultsController.object(at: indexPath)
        
        cell.nameLabel.text = appt.tutorName
        cell.apptLabel.text = appt.schedule
        
        return cell
    }
    
    // Function for allowing tableView individual cell edits, which is set to true, since there is a button that will activate that function
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // IBAction function for toggling the edit button
    @IBAction func toggleEdit(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    // Function for deleting appointments from the tableView
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            
            
            let title = "Delete Appointment?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                if editingStyle == .delete {
                                                    
                                                    // Creates a context reference and deletes the object at indexPath
                                                    let context = self.fetchedResultsController.managedObjectContext
                                                    context.delete(self.fetchedResultsController.object(at: indexPath))
                                                    
                                                    do {
                                                        try context.save()
                                                    } catch {
                                                        // Replace this implementation with code to handle the error appropriately.
                                                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                                                        let nserror = error as NSError
                                                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                                                    }
                                                }

            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    // Function for telling fetchResultsController changes are going to happen.
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    // Function for telling fetchResultsController changes have happened already.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // Function for handling the tableView manipulation with the fetchResultsController
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        default:
            break;
        }
    }

}
