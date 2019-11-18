//
//  utils.swift
//  Rudrik_c0757521_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Rudrik. All rights reserved.
//

import Foundation
import UIKit

func findTextField(txts: [UITextField], identifier: String) -> UITextField? {
    return txts.filter { (t) -> Bool in
        t.accessibilityIdentifier == identifier
    }.first!
}

func showMessage(vc: UIViewController, title: String, msg: String?) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (act) in
        alert.dismiss(animated: true, completion: nil)
    }))
    alert.actions[0].setValue(UIColor.red, forKey: "titleTextColor")
    vc.present(alert, animated: true, completion: nil)
}

func showMessage(tvc: UITableViewController, title: String, msg: String?) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (act) in
        alert.dismiss(animated: true, completion: nil)
    }))
    alert.actions[0].setValue(UIColor.red, forKey: "titleTextColor")
    tvc.present(alert, animated: true, completion: nil)
}
