//
//  Semester.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by Rudrik Panchal on 2019-11-15.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Semester {
    var semName: String{
        didSet{
            switch self.semName {
            case "Semester1", "Sem1":
                self.courses = [Course(cName: "MAD2303", cMarks: 0), Course(cName: "MAD3463", cMarks: 0), Course(cName: "MAD3004", cMarks: 0), Course(cName: "MAD3115", cMarks: 0), Course(cName: "MAD3125", cMarks: 0)]
                
            case "Semester2", "Sem2":
                self.courses = [Course(cName: "MAD3144", cMarks: 0), Course(cName: "MAD4114", cMarks: 0), Course(cName: "MAD4124", cMarks: 0), Course(cName: "MAD5254", cMarks: 0), Course(cName: "CPP1001", cMarks: 0)]
            
            case "Semester3", "Sem3":
                self.courses = [Course(cName: "MAD5234", cMarks: 0), Course(cName: "MAD5274", cMarks: 0), Course(cName: "MAD6114", cMarks: 0), Course(cName: "MAD6123", cMarks: 0), Course(cName: "MAD6135", cMarks: 0)]
            default:
                return
            }
        }
    }
    var courses: [Course]?
    var GPA: Float = 0.0
}
