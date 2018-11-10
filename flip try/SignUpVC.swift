//
//  SignUpVC.swift
//  flip try
//
//  Created by A. Yes on 29/09/2018.
//  Copyright © 2018 A. Yes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SwiftKeychainWrapper
import SVProgressHUD

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSignUp" {
            
            if let destination = segue.destination as? RegisterVC {
                
                if self.userUid != nil {
                    
                    destination.userUid = userUid
                }
                
                if self.emailTextfield.text != nil {
                    
                    destination.emailField = emailTextfield.text
                }
                
                if self.passwordTextfield.text != nil {
                    
                    destination.passwordField = passwordTextfield.text
                }
            }
        }
    }
        
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    
    SVProgressHUD.show()
        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print("Can't create user")
                
                SVProgressHUD.dismiss()
                self.welcomeLabel.text = "Try Again"
                
            } else {
                print("Login Successful!")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToFeed", sender: self)
            }
            
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

}
