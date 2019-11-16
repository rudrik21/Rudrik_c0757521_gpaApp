//
//  Course.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by Rudrik Panchal on 2019-11-15.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation

struct Course {

    var cName: String
    var cMarks: Int
    var credit: Int?
    var gpa: Float{
            switch cMarks {
                case 94...100:
                    return (4.0 * (Float(credit!)))
                case 87...93:
                    return (3.7 * (Float(credit!)))
                case 80...86:
                    return (3.5 * (Float(credit!)))
                case 77...79:
                    return (3.2 * (Float(credit!)))
                case 73...76:
                    return (3.0 * (Float(credit!)))
                case 70...72:
                    return (2.7 * (Float(credit!)))
                case 67...69:
                    return (2.3 * (Float(credit!)))
                case 63...66:
                    return (2.0 * (Float(credit!)))
                case 60...62:
                    return (1.7 * (Float(credit!)))
                case 50...59:
                    return (1.0 * (Float(credit!)))
                case 0...49:
                    return 0.0
                default:
                    return 0.0
            }
    }
    
    init(cName: String, cMarks: Int) {
        self.cName = cName
        self.cMarks = cMarks
        
        credit = (self.cName.isEmpty ? 1 : Int(cName.dropFirst(self.cName.count - 1)))
        
        }
}
