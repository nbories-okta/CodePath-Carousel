//
//  LoginViewController.swift
//  Carousel
//
//  Created by Nicolas Bories on 2/11/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!
    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!
    
   
    //transform array
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = loginImage.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        // content offset: 0 -> 568
        // x offset: -30 -> 0
        // y offset -285 -> 0
        
        var tx1 = convertValue(offset, 0, 568, -80, 0)
        var ty1 = convertValue(offset, 0, 568, -285, 0)
        var scale1 = convertValue(offset, 0, 568, 1, 1)
        var rotation1 = convertValue(offset, 0, 568, -10, 0)
        
        tile1Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1Image.transform = CGAffineTransformScale(tile1Image.transform, CGFloat(scale1),  CGFloat(scale1))
        tile1Image.transform = CGAffineTransformRotate(tile1Image.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        var tx2 = convertValue(offset, 0, 568, 22, 0)
        var ty2 = convertValue(offset, 0, 568, -245, 0)
        var scale2 = convertValue(offset, 0, 568, 1.9, 1)
        var rotation2 = convertValue(offset, 0, 568, -10, 0)
        
        tile2Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2Image.transform = CGAffineTransformScale(tile2Image.transform, CGFloat(scale2),  CGFloat(scale2))
        tile2Image.transform = CGAffineTransformRotate(tile2Image.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        var tx3 = convertValue(offset, 0, 568, 50, 0)
        var ty3 = convertValue(offset, 0, 568, -420, 0)
        var scale3 = convertValue(offset, 0, 568, 1.9, 1)
        var rotation3 = convertValue(offset, 0, 568, 10, 0)
        
        tile3Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3Image.transform = CGAffineTransformScale(tile3Image.transform, CGFloat(scale3),  CGFloat(scale3))
        tile3Image.transform = CGAffineTransformRotate(tile3Image.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        var tx4 = convertValue(offset, 0, 568, -65, 0)
        var ty4 = convertValue(offset, 0, 568, -510, 0)
        var scale4 = convertValue(offset, 0, 568, 1.9, 1)
        var rotation4 = convertValue(offset, 0, 568, -8, 0)
        
        tile4Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4Image.transform = CGAffineTransformScale(tile4Image.transform, CGFloat(scale4),  CGFloat(scale4))
        tile4Image.transform = CGAffineTransformRotate(tile4Image.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        var tx5 = convertValue(offset, 0, 568, -100, 0)
        var ty5 = convertValue(offset, 0, 568, -490, 0)
        var scale5 = convertValue(offset, 0, 568, 1.9, 1)
        var rotation5 = convertValue(offset, 0, 568, 6, 0)
        
        tile5Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5Image.transform = CGAffineTransformScale(tile5Image.transform, CGFloat(scale5),  CGFloat(scale5))
        tile5Image.transform = CGAffineTransformRotate(tile5Image.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        var tx6 = convertValue(offset, 0, 568, 70, 0)
        var ty6 = convertValue(offset, 0, 568, -430, 0)
        var scale6 = convertValue(offset, 0, 568, 1.9, 1)
        var rotation6 = convertValue(offset, 0, 568, 8, 0)
        
        tile6Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6Image.transform = CGAffineTransformScale(tile6Image.transform, CGFloat(scale6),  CGFloat(scale6))
        tile6Image.transform = CGAffineTransformRotate(tile6Image.transform, CGFloat(Double(rotation6) * M_PI / 180))    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
