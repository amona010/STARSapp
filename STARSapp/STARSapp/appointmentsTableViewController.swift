// PROGRAMMER:  Dominique Felix
// PANTHERID:   4199402
// CLASS:       COP 4655-01
// INSTRUCTOR:  Steve Luis ECS 282
// ASSIGNMENT:  Group Project (STARS App)
// DUE:         Tuesday 12/6/18
//

import Foundation
import UIKit
import CoreData

//Custom tableView cell class
class tutorAppointmentCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var apptLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
}

class appointmentsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    // Context where Appointment objects are saved
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var data = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
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
        cell.phoneLabel.text = String(appt.phoneNumber)
        
        return cell
    }
    
    // Function for allowing tableView edits, which is set to true, since appointments can get cancelled.
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
            let appt: NSManagedObject = fetchedResultsController.object(at: indexPath)
            
            
            let title = "Delete Appointment?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the context
                                                self.managedObjectContext?.perform {
                                                    self.managedObjectContext?.delete(appt)
                                                }
                                                do {
                                                    try self.managedObjectContext?.save()
                                                } catch {
                                                    let nserror = error as NSError
                                                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                                                }
                                                                                                
                                                // Also remove that row from the table view with an animation
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
}
