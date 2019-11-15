//
//  Student.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Student{
    var firstName : String
    var lastName : String 
    var studentID : String
    var CGPA: Float = 0.0
    
    static var students: [Student] = [Student(firstName: "Rudrik", lastName: "Panchal", studentID: "123")]
    var semesters: [Semester] = []
    
    static func shouldAdd(studentID: String) -> Bool {
        //  returns true if 'not empty'
        return Student.students.filter { (s) -> Bool in
            s.studentID == studentID
        }.isEmpty
    }
}
