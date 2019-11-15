//
//  Course.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by Rudrik Panchal on 2019-11-15.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Course {
    var cName: String{
        didSet{
            self.credit = (self.cName.isEmpty ? 1 : Int(cName.dropFirst(self.cName.count - 1)))
        }
    }
    
    var cMarks: Int {
        didSet{
            switch self.cMarks {
                case 94...100:
                    self.cGPA = 4.0
                case 87...93:
                    self.cGPA = 3.7
                case 80...86:
                    self.cGPA = 3.5
                case 77...79:
                    self.cGPA = 3.2
                case 73...76:
                    self.cGPA = 3.0
                case 70...72:
                    self.cGPA = 2.7
                case 67...69:
                    self.cGPA = 2.3
                case 63...66:
                    self.cGPA = 2.0
                case 60...62:
                    self.cGPA = 1.7
                case 50...59:
                    self.cGPA = 1.0
                case 0...49:
                    self.cGPA = 0.0
                default:
                    self.cGPA = 0.0
            }
        }
    }
    var credit: Int?
    var cGPA: Float?
}
