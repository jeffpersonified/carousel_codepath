//
//  LoginViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginInstructionImageView: UIImageView!
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authenticationButtonsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func keyboardWillShow(notification: NSNotification!) {

        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        
        loginInstructionImageView.hidden = true
        UIView.animateWithDuration(0.4, animations: {
            self.textFieldsView.frame.origin.y = 67
            self.authenticationButtonsView.frame.origin.y = 568 - kbSize.height - 113
        })
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        loginInstructionImageView.hidden = true
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }

}
