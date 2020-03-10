//
//  HumansEditViewController.swift
//  CheckingStoreData
//
//  Created by мак on 09.03.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//

import UIKit

class HumansEditViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
    }
    

    var selectedHuman : Human?
       @IBAction func addNewHuman(_ sender: Any) {
           selectedHuman = Human.newHuman(name: "")
        performSegue(withIdentifier: "goToNewHuman", sender: self)
        
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToNewHuman" {
            (segue.destination as! NewHumanViewController).human = selectedHuman
           }
       }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return humans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyViewCell

          let humanInCell = humans[indexPath.row]
              
              cell.nameHuman.text = humanInCell.name
              cell.genderHuman.text = humanInCell.gender
              cell.ageHuman.text = humanInCell.age

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let humanInCell = humans[indexPath.row]
        selectedHuman = humanInCell
        performSegue(withIdentifier: "goToNewHuman", sender: self)
    }

    
    // Override to support editing the table view.
    //Удаляем ячейки из таблицы  HumansViewEditControlelr
          override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
              if editingStyle == .delete {
                  let humansInCell = humans[indexPath.row]
                  
                  CoreDataManager.sharedInstance.managedObjectContext.delete(humansInCell)
                  CoreDataManager.sharedInstance.saveContext()
                  
                  tableView.deleteRows(at: [indexPath], with: .fade)
              } else if editingStyle == .insert {
                  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
              }
          }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue) {
        guard let newHumanVC = segue.source as? NewHumanViewController else { return }

        newHumanVC.saveHuman()
        tableView.reloadData()
    }
    
   
       

    
    
}
