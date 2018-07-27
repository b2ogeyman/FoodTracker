//
//  SignUpViewController.swift
//  FoodTracker
//
//  Created by kostya on 7/18/18.
//  Copyright © 2018 kostya. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    var db: Firestore!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        db = Firestore.firestore()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpButton(_ sender: UIButton) {
            
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                    Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                        
                        if error == nil {
                            
                            //Print into the console if successfully logged in
                            print("You have successfully logged in")
                            self.db.collection("users").addDocument(data: ["username": self.usernameTextField.text!])
                            
                            //Go to the HomeViewController if the login is sucessful
                            self.presentingViewController?.dismiss(animated: true, completion: nil)
                            
                        }
                    }
                    
                   // let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                   // self.present(vc!, animated: true, completion: nil)
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
