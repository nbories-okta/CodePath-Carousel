//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/14/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeForSpinButton: UIButton!
    @IBOutlet weak var buttonContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
        buttonContainer.alpha = 0.0
        pageControl.alpha = 1.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println(scrollView.contentOffset.x)
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        
        
        if (page == 3) {
            delay(0.5, { () -> () in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.pageControl.alpha = 0.0
                    self.buttonContainer.alpha = 1.0
                    
                })
            })
            
        } else {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.buttonContainer.alpha = 0.0
                self.pageControl.alpha = 1.0
            })
            
        }

    }

    @IBAction func didPressTakeForSpinButton(sender: AnyObject) {
        performSegueWithIdentifier("timelineSegue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
