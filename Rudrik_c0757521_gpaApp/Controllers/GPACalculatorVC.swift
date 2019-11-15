//
//  GPACalculatorVC.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import UIKit

class GPACalculatorVC: UIViewController {

    
    //  MARK: Variables
    var delegate: StudentsTVC?
    
    //  MARK: Outlets
    
    @IBOutlet weak var segSems: UISegmentedControl!
    
    @IBOutlet var lblCourses: [UILabel]!
    @IBOutlet var txtCourses: [UITextField]!
    
    @IBOutlet weak var lblGPA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func start() {
        
    }
    @IBAction func onSemeChange(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func onCalculateGPA(_ sender: UIButton) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
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



/*

 func calculateGPA(marks: Int) -> Float {
     switch marks {
     case 94...100:
         return 4.0
     case 87...93:
         return 3.7
     case 80...86:
         return 3.5
     case 77...79:
         return 3.2
     case 73...76:
         return 3.0
     case 70...72:
         return 2.7
     case 67...69:
         return 2.3
     case 63...66:
         return 2.0
     case 60...62:
         return 1.7
     case 50...59:
         return 1.0
     case 0...49:
         return 0.0
     default:
         break
     }
     return 0.0
 }
 
 */
 
