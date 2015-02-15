//
//  SignInViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/11/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {


    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signinContainer: UIView!
    @IBOutlet weak var fieldContainer: UIView!
    
    var originalLoginYCenter: CGFloat!
    var originalButtonsYCenter: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalLoginYCenter = loginContainer.center.y
        originalButtonsYCenter = signinContainer.center.y
        
        emailField.autocorrectionType = UITextAutocorrectionType.No
        passwordField.autocorrectionType = UITextAutocorrectionType.No  
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.loginContainer.center.y = 86
            self.signinContainer.center.y = 330
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.loginContainer.center.y = self.originalLoginYCenter
            self.signinContainer.center.y = self.originalButtonsYCenter
            
            }, completion: nil)
    }

    
    

    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    @IBAction func didPressSigninButton(sender: AnyObject) {
        if (self.emailField.text.isEmpty == true && self.passwordField.text.isEmpty == true) {
            
            var alertViewEmpty = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK")
            alertViewEmpty.show()
            
        } else if (self.emailField.text == "nico@gmail.com" && self.passwordField.text == "password") {
            
            var signinginLoaderView = UIAlertView(title: "Signing In", message: nil, delegate: nil, cancelButtonTitle: nil)
            signinginLoaderView.show()
            
            delay(2, { () -> () in
                signinginLoaderView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("signinSegue", sender: self)
            })
            
        } else {
            var signinginLoaderView = UIAlertView(title: "Signing In", message: nil, delegate: nil, cancelButtonTitle: nil)
            signinginLoaderView.show()
            
            delay(2, { () -> () in
            signinginLoaderView.dismissWithClickedButtonIndex(0, animated: true)
             
            var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            })
        }
    }
}
