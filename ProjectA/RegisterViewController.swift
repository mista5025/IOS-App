//
//  RegisterViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 7/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        let name = nameTextField.text!
        let address = addressTextField.text!
        let email = emailTextField.text!
        let phone = phoneTextField.text!
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        // vaidation
        if(name == "" || address == "" || email == "" || phone == "" || username == "" || password == "") {
            let alert = UIAlertController(title: "Error", message: "Please, Fill all of the field ", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) {
                action in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        //store these variables to iphone locally
        UserDefaults.standard.set(name, forKey: "Name")
        UserDefaults.standard.set(address, forKey: "Address")
        UserDefaults.standard.set(email, forKey: "Email")
        UserDefaults.standard.set(phone, forKey: "Phone")
        UserDefaults.standard.set(username, forKey: "Username")
        UserDefaults.standard.set(password, forKey: "Password")
        
        //create new alert controller to show confirmation message
        let alert = UIAlertController(title: "Travel Location", message: "Registration succesfully", preferredStyle: .alert)
        
        //move to Login page
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(vc!, animated: true)
        
        //create action for alert controller
        let action = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        //add or link action to alert view controller
        alert.addAction(action)
        Clear()
        present(alert, animated: true, completion: nil)
        
        
    }
    func Clear() {
        nameTextField.text = ""
        addressTextField.text! = ""
        emailTextField.text! = ""
        phoneTextField.text! = ""
        usernameTextField.text! = ""
        passwordTextField.text! = ""
        
    }
}
