//
//  ViewController.swift
//  CheckingStoreData
//
//  Created by мак on 26.02.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mailTextfield: UITextField!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var logButtonAppear: UIButton!
    
    
    var myTimer = Timer()
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        progressBar.isHidden = true
        progressBar.progress = 0.0
        logButtonAppear.isHidden = true
        
        
        // скрытие клавиатуры при нажатии в другую область
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //селектор скрытия клавиатуры
    @objc func dismissKeyBoard () {
        view.endEditing(true)
    }

    @IBAction func checkButton(_ sender: Any) {
        progressBar.isHidden = false
        createTimer()

    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        logButtonAppear.isHidden = true
        
    }
    
    func createTimer () {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgress () {
        // если прогресс линия не равна 1.0
        if progressBar.progress != 1.0 {
            // прибавляем значение  на каждые 0.35
            progressBar.progress += 0.35
        } else {
            // в противном случае
            myTimer.invalidate()
            progressBar.progress = 0
            progressBar.isHidden = true
            if (mailTextfield.text == "test@test.ru") && (passTextfield.text == "1234") {
                logButtonAppear.isHidden = false
                resetFields()
                
            } else  {
                logButtonAppear.isHidden = true
                let alert = UIAlertController(title: "ВНИМАНИЕ!", message: "Такой пользователь не зарегистрирован", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        mailTextfield.resignFirstResponder()
//        passTextfield.resignFirstResponder()
//        return true
//    }
    
    func resetFields () {
        mailTextfield.text = ""
        passTextfield.text = ""
    }
    
}

