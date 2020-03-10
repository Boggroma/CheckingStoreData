//
//  MainViewController.swift
//  CheckingStoreData
//
//  Created by мак on 27.02.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    

    @IBAction func logOutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pushMenu(_ sender: Any) {
        if menuShowing {
        leading.constant = 145
        } else {
            leading.constant = 0
        }
        menuShowing = !menuShowing
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
}
