//
//  ViewController.swift
//  Experiment
//
//  Created by Melanie Gravier on 12/1/17.
//  Copyright © 2017 Melanie Gravier. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {
    var signupModeActive = true
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func signupOrLogin(_ sender: Any) {
        // check for user input in the username and password fields
        if username.text == "" || password.text == "" {
            displayAlert(title: "Error in form",message: "Please enter an email and password")
        }
        else {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            
            
            
            if (signupModeActive) {
                print("Signing up...")
                
                let user = PFUser()
                user.username = username.text
                user.password = password.text
                user.signUpInBackground(block: { (success, error) in
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if let error = error {
                        self.displayAlert(title: "Could not sign you up", message: error.localizedDescription)
                    }
                    else {
                        print("Signed up!")
                        
                    }
                })
            } else {
                PFUser.logInWithUsername(inBackground: username.text!, password: password.text!, block: { (user, error) in
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if user != nil {
                        print("Login successful")
                        let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        
                        appDelegate.window?.rootViewController = myTabBar
                        
                    } else {
                        var errorText = "Unknown error: please try again"
                        if let error = error {
                            errorText = error.localizedDescription
                        }
                        self.displayAlert(title: "Could not sign you up", message: error!.localizedDescription)
                    }
                })
            }
        }
    }
    
    @IBOutlet var signupOrLoginButton: UIButton!
    
    @IBAction func switchLoginMode(_ sender: Any) {
        // from signup mode to login mode
        if (signupModeActive) {
            signupModeActive = false
            signupOrLoginButton.setTitle("Log In", for:[])
            switchLoginModeButton.setTitle("Sign Up", for: [])
        }
        // from login mode to signup mode
        else {
            signupModeActive = true
            signupOrLoginButton.setTitle("Sign Up", for: [])
            switchLoginModeButton.setTitle("Log In", for: [])
        }
        
    }
    @IBOutlet var switchLoginModeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

