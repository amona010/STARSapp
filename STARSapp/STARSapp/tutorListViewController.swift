//
//  tutorListViewController.swift
//  STARSapp
//
//  Created by Alexander Monaco on 11/26/18.
//  Copyright © 2018 FIU. All rights reserved.
//

import Foundation
import UIKit


class tutorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tutorTable: UITableView!
    
    var data = modelData.getSome
    var useThisData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tutorTable.delegate = self
        self.tutorTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        useThisData = data.setDataToReturn() as! [[String]]
        tutorTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.setDataToReturn().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tutorCell", for: indexPath)
        cell.textLabel?.text = useThisData[indexPath.row][0]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier
        {
            case "showDetail"?:
                if let row = tutorTable.indexPathForSelectedRow?.row
                {
                    let tutor = data.setDataToReturn()[row] as! [String]
                    let detailViewController = segue.destination as! detailViewController
                    //viewController passes model class information to detailView
                    detailViewController.array1 = tutor[1].components(separatedBy: ", ")
                    detailViewController.array2 = tutor[3].components(separatedBy: ", ")
                    detailViewController.name = tutor[0]
                    detailViewController.email = tutor[2]
                    detailViewController.grade = tutor[4]
                    detailViewController.schedule = tutor[5].components(separatedBy: ", ")[0]
                    detailViewController.availability = tutor[5].components(separatedBy: ", ")[1]
                }
                break
            case "showFilter"?:
                print("Filter")
                break
            
            default:
                print("error")
            
        }
    }
    
}
