//
//  Student.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Student : CustomStringConvertible {
    var firstName : String
    var lastName : String 
    var studentID : String
    
    static var students: [Student] = []
    var semesters: [Semester]?
    
    var CGPA: Float?{
        var totalCGPA: Float = 0.0
        semesters!.forEach { (s) in
            totalCGPA += s.GPA
        }
        return Float(String(format: "%.2f", (totalCGPA / Float(semesters!.count))))
    }
    
    var index : Int {
        return Student.students.firstIndex { (s) -> Bool in
            s.studentID == self.studentID
        }!
    }
    
    var description: String{
        var res = ""
        res += firstName + "\n"
        res += lastName + "\n"
        res += studentID + "\n"
        res += String(CGPA!) + "\n"
        res += String(semesters!.count)
        semesters!.forEach { (s) in
            res += String(s.GPA) + "\n"
        }
        return res
    }
}
