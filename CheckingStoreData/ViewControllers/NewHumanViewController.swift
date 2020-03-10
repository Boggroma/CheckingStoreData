//
//  NewHumanViewController.swift
//  CheckingStoreData
//
//  Created by мак on 08.03.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//

import UIKit

class NewHumanViewController: UITableViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameHuman: UITextField!
    @IBOutlet weak var ageHuman: UITextField!
    @IBOutlet weak var genderHuman: UITextField!
    
    var human: Human?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        nameHuman.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        nameHuman.text = human?.name
        ageHuman.text = human?.age
        genderHuman.text = human?.gender
        
        title = human?.name
        
    }
    
   
    
   
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
 
    func saveHuman () {
        
        human?.name = nameHuman.text!
        human?.age = ageHuman.text
        human?.gender = genderHuman.text
        CoreDataManager.sharedInstance.saveContext()
        
    }
    
    
    
    
}
// MARK: - Table view delegate

extension NewHumanViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged () {
        if nameHuman.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
