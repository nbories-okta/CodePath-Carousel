//
//  CreateDropboxViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/14/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class CreateDropboxViewController: UIViewController, UIAlertViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createAccountView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    
    var originalFormsCenter: CGFloat!
    var originalButtonCenter: CGFloat!
    var screen = UIScreen.mainScreen().bounds
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalFormsCenter = scrollView.center.y
        originalButtonCenter = createAccountView.center.y
        screenHeight = screen.size.height
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:320, height:500)

        
        firstNameField.autocorrectionType = UITextAutocorrectionType.No
        lastNameField.autocorrectionType = UITextAutocorrectionType.No
        emailField.autocorrectionType = UITextAutocorrectionType.No
        passwordField.autocorrectionType = UITextAutocorrectionType.No  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkButtonDidPress(sender: AnyObject) {
        checkButton.selected = !checkButton.selected
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
            
            self.scrollView.contentSize = CGSize(width:320, height:500)
            self.createAccountView.center.y = self.screenHeight - kbSize.height - 50
            self.scrollView.center.y = 220
            
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
            
            self.scrollView.contentSize = CGSize(width:320, height:500)
            self.scrollView.center.y = self.originalFormsCenter
            self.createAccountView.center.y = self.originalButtonCenter
            
            }, completion: nil)
    }

    
    
    @IBAction func createButtonDidPress(sender: AnyObject) {
        if (self.firstNameField.text.isEmpty == true && self.lastNameField.text.isEmpty == true && self.emailField.text.isEmpty == true && self.passwordField.text.isEmpty == true)
        {
            var alertEmptyView = UIAlertView(title: "Information Required", message: "First name, last name, email, and password are required to create a DropBox account", delegate: nil, cancelButtonTitle: "OK")
            alertEmptyView.show()
        } else {
            var signinginLoaderView = UIAlertView(title: "Creating Account", message: nil, delegate: nil, cancelButtonTitle: nil)
            signinginLoaderView.show()
            
            delay(1.2, { () -> () in
                signinginLoaderView.dismissWithClickedButtonIndex(0, animated: true)
            self.performSegueWithIdentifier("createSegue", sender: self)
            })
        }
    }

    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
}
