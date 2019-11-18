//
//  RegisterStudentVC.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import UIKit

class RegisterStudentVC: UIViewController {

    //  MARK: Variables
    var delegate: StudentsTVC?
    
    
    //  MARK: Outlets
    @IBOutlet var txtStudent: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view.
    }

    //  MARK: INITIALIZERS
    func start() {
        txtStudent[0].becomeFirstResponder()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   //   ON Save button click
    @IBAction func onSaveStudent(_ sender: UIButton) {
        
        let student: Student = Student(firstName: txtStudent[0].text!, lastName: txtStudent[1].text!, studentID: txtStudent[2].text!, semesters: [Semester(semName: "Semester1"), Semester(semName: "Semester2"), Semester(semName: "Semester3")])
            
        shouldAddStudent(student)
            
        print(Student.students)
    }
    
    //  Check whether student is valid or not!
    func shouldAddStudent(_ student: Student){
        if checkTexts(){
            let alert = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "No way!", style: .cancel, handler: { (act) in
                alert.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Yes,I'mSure!", style: .default, handler: { (act) in
                Student.students.append(student)
                self.clearTexts()
                showMessage(vc: self, title: "New Contact Saved", msg: "\(student.firstName) is now a student.")
            }))
            alert.actions[0].setValue(UIColor.red, forKey: "titleTextColor")
            alert.actions[1].setValue(UIColor.green, forKey: "titleTextColor")
            alert.view.layer.cornerRadius = 40
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    //  checks empty texts or duplicate ID
    func checkTexts() -> Bool {
        var isValid = false
        if !txtStudent.filter({ (txt) -> Bool in
            txt.text!.isEmpty
        }).isEmpty{
            showMessage(vc: self, title: "Entered data might have empty values", msg: nil)
        }else{
            let sid = findTextField(txts: txtStudent, identifier: "txtStudentID")?.text
            if !Student.students.filter({ (std) -> Bool in
                std.studentID == sid
            }).isEmpty {
                showMessage(vc: self, title: "Duplicate Student ID!", msg: "This ID has been taken.")
            }else{
                isValid = true
            }
        }
        return isValid
    }
    
    //  MARK: Invalidate textViews
    func clearTexts() {
        txtStudent.forEach { (txt) in
            txt.text = nil
        }
        txtStudent[0].becomeFirstResponder()
    }
    
    //  Return to parent view
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
