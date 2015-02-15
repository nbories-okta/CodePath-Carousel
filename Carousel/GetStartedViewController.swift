//
//  GetStartedViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/14/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {



    @IBOutlet weak var box1Button: UIButton!
    @IBOutlet weak var box2Button: UIButton!
    @IBOutlet weak var box3Button: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func box1DidPress(sender: AnyObject) {
        box1Button.selected = !box1Button.selected
    }

    @IBAction func box2DidPress(sender: AnyObject) {
        box2Button.selected = !box2Button.selected
    }
    
    @IBAction func box3DidPress(sender: AnyObject) {
        box3Button.selected = !box3Button.selected
    }
    
    @IBAction func didPressCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
