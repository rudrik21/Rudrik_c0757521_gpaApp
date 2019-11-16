//
//  GPACalculatorVC.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import UIKit
import AVFoundation

class GPACalculatorVC: UIViewController {

    
    //  MARK: Variables
    var delegate: StudentsTVC?
    var student: Student?
    var semester: Semester?
    var audio : AVAudioPlayer!
    
    //  MARK: Outlets
    
    @IBOutlet weak var segSems: UISegmentedControl!
    
    @IBOutlet var lblCourses: [UILabel]!
    @IBOutlet var txtCourses: [UITextField]!
    
    @IBOutlet weak var lblGPA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    func start() {
        segSems.selectedSegmentIndex = 0
        onSemChange(segSems)
    }
    
    @IBAction func onSemChange(_ sender: UISegmentedControl) {
//        print(sender.selectedSegmentIndex)
        if audio != nil{
            audio.stop()
        }
        
        txtCourses[0].becomeFirstResponder()
        
        switch sender.selectedSegmentIndex {
        case 0:
            //  sem 1
            sender.selectedSegmentIndex = 0
            self.semester = (Student.students[student!.index].semesters![0])
            loadData()
            break
        case 1:
            //  sem 2
            sender.selectedSegmentIndex = 1
            self.semester = (Student.students[student!.index].semesters![1])
            loadData()
            break
        case 2:
            //  sem 3
            sender.selectedSegmentIndex = 2
            self.semester = (Student.students[student!.index].semesters![2])
            loadData()
            break
        default:
            return
        }
    }
    
    func loadData() {
        setFields(courses: (semester!.courses!))
    }
    
    func setFields(courses: [Course]) {
        print(courses)
        for (i, c) in courses.enumerated() {
            lblCourses[i].text = c.cName
            txtCourses[i].text = (c.cMarks <= 0 ? nil : String(c.cMarks))
        }
        lblGPA.text = (semester?.GPA == 0.0 ? "ex. 3/4" : String(semester!.GPA))
    }
    
    func checkFields() -> Bool {
        if !txtCourses.filter({ (txt) -> Bool in
            txt.text!.isEmpty
        }).isEmpty{
            showMessage(vc: self, title: "Entered data might have empty values", msg: nil)
        }else{
             return true
        }
        return false
    }
    
    @IBAction func onCalculateGPA(_ sender: UIButton) {
        if checkFields(){
            setData()
        }
    }
    
    func setData() {
        for i in 0..<txtCourses.count {
            semester?.courses![i].cMarks = Int(String(txtCourses[i].text!))!
        }
        print("GPA: ",Float(semester!.GPA))
        lblGPA.text = String(semester!.GPA)
        
        if semester!.GPA > 2.8{
            let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
            audio = try! AVAudioPlayer(contentsOf: soundURL!)
            audio.play()
        }
        
        Student.students[student!.index].semesters![semester!.index] = semester!
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
 
