//
//  StudentsTVC.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import UIKit

class StudentsTVC: UITableViewController {

    
    //  MARK: VARIABLES
    var students: [Student] = []
    
    //  MARK: OUTLETS
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func start() {
        students = Student.students
        searchBar.delegate = self
        self.tableView.becomeFirstResponder()
        
        updateData()
    }
    
    func updateData() {
        students = Student.students
        self.tableView.reloadData()
        students.forEach { (s) in
            print(s)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let registerStudentVC = segue.destination as? RegisterStudentVC{
            if let _ = sender as? UIBarButtonItem{
                registerStudentVC.delegate = self
            }
        }
        
        if let gpaCalculatorVC = segue.destination as? GPACalculatorVC {
            gpaCalculatorVC.delegate = self
            if let cell = sender as? UITableViewCell{
                gpaCalculatorVC.student = Student.students.filter({ (s) -> Bool in
                    s.firstName == cell.textLabel!.text!
                    }).first
            }
        }
    }
}


//  MARK: - Table view data source & Delegates
extension StudentsTVC{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student.firstName
        cell.detailTextLabel?.text = String(student.CGPA!)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}


//  MARK: Search bar Delegates
extension StudentsTVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty{
            students = Student.students.filter({ (s) -> Bool in
                s.firstName.lowercased().hasPrefix(searchText.lowercased())
            })
            tableView.reloadData()
        }else{
            students = Student.students
        }
        tableView.reloadData()
    }
}
