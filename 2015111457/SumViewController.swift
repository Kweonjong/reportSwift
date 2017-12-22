//
//  SumViewController.swift
//  2015111457
//
//  Created by SWUCOMPUTER on 2017. 12. 22..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SumViewController: UIViewController {
    @IBOutlet var sumLabel: UILabel!
    
    var sumTree: NSManagedObject?
    var price: Int16 = 0
    var num: Int16 = 0
    var total: Int16 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if let tree = sumTree {
            price = tree.value(forKey: "treeprice") as! Int16
            sumLabel.text = String(price)
            
        }
    }

    
    

    
    

}
