//
//  LoginViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var initialTextFieldsCenter = CGPoint()
    
    @IBOutlet weak var loginInstructionImageView: UIImageView!
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authenticationButtonsView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialTextFieldsCenter = textFieldsView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func keyboardWillShow(notification: NSNotification!) {

        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        
        UIView.animateWithDuration(0.4, animations: {
            self.loginInstructionImageView.hidden = true
            self.textFieldsView.frame.origin.y = 67
            self.authenticationButtonsView.frame.origin.y = 568 - kbSize.height - 113
        })
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        UIView.animateWithDuration(0.4, animations: {
            self.textFieldsView.center = self.initialTextFieldsCenter
            self.authenticationButtonsView.frame.origin.y = 568 - 113
            self.loginInstructionImageView.hidden = false
        })
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func signInButtonDidPress(sender: AnyObject) {
        if emailTextField.text == "" {
            emailBlank()
        } else if passwordTextField.text == "" {
            passwordBlank()
        } else {
            var authAlertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            
            authAlertView.show()
            self.signInButton.enabled = false
            
            delay(2) {
                authAlertView.show()
                self.checkCredentials()
                authAlertView.dismissWithClickedButtonIndex(0, animated: true)
            }
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func emailBlank() {
        var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func passwordBlank() {
        var alertView = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func incorrectCredentials() {
        var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func checkCredentials() {
        if emailTextField.text == "jeff@example.com" && passwordTextField.text == "password" {
            println("success")
        } else {
            self.signInButton.enabled = true
            incorrectCredentials()
        }
    }
}
