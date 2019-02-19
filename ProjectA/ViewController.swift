//
//  ViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 7/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        
        let un = usernameTextField.text!
        let pwd = passwordTextField.text!
        //read values stored in user defaults when user registred
        let username = UserDefaults.standard.string(forKey: "Username")
        let password = UserDefaults.standard.string(forKey: "Password")
        
        let alert : UIAlertController
        
        if(un == username && pwd == password)
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
            navigationController?.pushViewController(vc!, animated: true)
            //alert controller
            alert = UIAlertController(title: "Login Successful", message: "Welcome to Travel Location", preferredStyle: .alert)
        }
        else
        {
            alert = UIAlertController(title: "Failure", message: "Sorry Try again", preferredStyle: .alert)
            
        }
        
        let action = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        usernameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
}

