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

    func start() {
        print(txtStudent.count)
    }
   
    @IBAction func onSaveStudent(_ sender: UIButton) {
        if Student.shouldAdd(studentID: findTextField(txts: txtStudent, identifier: "txtStudentID")!.text!){
            if let student: Student = Student(firstName: findTextField(txts: txtStudent, identifier: "txtFirstName")!.text!, lastName: findTextField(txts: txtStudent, identifier: "txtLastName")!.text!, studentID: findTextField(txts: txtStudent, identifier: "txtStudentID")!.text!){
                Student.students.append(student)
            }
        }
        print(Student.students)
    }
    
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
