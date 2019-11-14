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
    }.first
}
