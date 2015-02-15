//
//  FeedViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/14/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var learnMoreBanner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = feedImage.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func xButtonDidPess(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.feedImage.center.y -= 44
            self.learnMoreBanner.center.y -= 44
            self.learnMoreBanner.alpha = 0
        })
    }



}
