//
//  appointmentsTableViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 12/4/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class tutorAppointmentCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var apptLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
}

class appointmentsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var appointmentTable: UITableView!
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var data = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appointmentTable.delegate = self
        self.appointmentTable.dataSource = self
        let context = self.managedObjectContext
        context?.perform {
            let appt = Appointment(context: context!)
            
            appt.tutorName = "Hello"
            appt.phoneNumber = 111111
            
            context?.insert(appt)
        }
        do {
            try context?.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
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
    
    var _fetchedResultsController: NSFetchedResultsController<Appointment>? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! tutorAppointmentCell
        let appt = fetchedResultsController.object(at: indexPath)
        
        cell.nameLabel.text = appt.tutorName
        cell.apptLabel.text = appt.schedule
        cell.phoneLabel.text = String(appt.phoneNumber)
        
        return cell
    }
    
    // Function for allowing tableView edits, which is set to true, since appointments can get cancelled.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
