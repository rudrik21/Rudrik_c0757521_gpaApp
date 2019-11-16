//
//  Semester.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by Rudrik Panchal on 2019-11-15.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Semester {
    var semName: String

    init(semName: String) {
        self.semName = semName
        
        switch semName {
                case "Semester1", "Sem1":
                    courses = [Course(cName: "MAD2303", cMarks: 0), Course(cName: "MAD3463", cMarks: 0), Course(cName: "MAD3004", cMarks: 0), Course(cName: "MAD3115", cMarks: 0), Course(cName: "MAD3125", cMarks: 0)]
                    
                case "Semester2", "Sem2":
                    courses = [Course(cName: "MAD3144", cMarks: 0), Course(cName: "MAD4114", cMarks: 0), Course(cName: "MAD4124", cMarks: 0), Course(cName: "MAD5254", cMarks: 0), Course(cName: "CPP1001", cMarks: 0)]
                
                case "Semester3", "Sem3":
                    courses = [Course(cName: "MAD5234", cMarks: 0), Course(cName: "MAD5274", cMarks: 0), Course(cName: "MAD6114", cMarks: 0), Course(cName: "MAD6123", cMarks: 0), Course(cName: "MAD6135", cMarks: 0)]
                default:
                    courses = []
                }
                print(courses!)
    }
    
    var courses: [Course]?
    
    var GPA: Float {
        var totalCredits = 0
        var totalGPA: Float = 0.0
        courses!.forEach({ (c) in
            totalCredits += c.credit!
            totalGPA += c.gpa
        })
        
        return Float(String(format: "%.2f", totalGPA / Float(totalCredits)))!
    }
    
    var index : Int {
        switch self.semName {
        case "Semester1", "Sem1":
            return 0
            
        case "Semester2", "Sem2":
            return 1
            
        case "Semester3", "Sem3":
            return 2
            
        default:
            return 0
        }
    }
}
