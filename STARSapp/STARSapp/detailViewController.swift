//
//  tutorInfoViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/28/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import UIKit
import MessageUI

class detailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate
{
    var array1 = [String]()
    var array2 = [String]()
    var name = ""
    var grade = ""
    var email = ""
    var schedule = ""
    var availability = ""
    var phone = ""
    var data = modelData.getSome
    
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
    
    @IBAction func makeAppointment()
    {
        var alert = UIAlertController()
        
        if(availability == "Available")
        {
            alert = UIAlertController(title: "Schedule appointment with " + name + "?", message: "This tutor is available!", preferredStyle: .alert)
        }
        else
        {
            alert = UIAlertController(title: "Schedule appointment with " + name + "?", message: "This tutor is not available!", preferredStyle: .alert)
        }
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            if(MFMessageComposeViewController.canSendText())
            {
                let message = MFMessageComposeViewController()
                message.body = "Hello " + self.name + ". My name is " + self.data.profileName + " and I would like to meet with you during your office hours: " + self.schedule
                message.recipients = [self.phone]
                message.messageComposeDelegate = self
                self.present(message, animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("No")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == classTableView)
        {
            return array1.count
        }
        else
        {
            return array2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
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
