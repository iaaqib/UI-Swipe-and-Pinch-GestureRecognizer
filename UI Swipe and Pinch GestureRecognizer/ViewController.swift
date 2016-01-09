//
//  ViewController.swift
//  UI Swipe and Pinch GestureRecognizer
//
//  Created by Aaqib Hussain on 09/01/2016.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let images = ["pic7.png","pic9.png","pic15.png"]
    
    @IBOutlet weak var imageFrame: UIImageView!
    var imageIndex = 0;
    let maxIndex = 2;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
    }

    @IBAction func swipeImages(sender: UISwipeGestureRecognizer) {
      
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeImages:"));
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeImages:"));
        
        leftSwipe.direction = .Left;
        rightSwipe.direction = .Right;
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        if(sender.direction == .Left)
        {
            imageIndex++;
            if(imageIndex > maxIndex)
            {
                imageIndex = 0;
            }
            
        }
        if(sender.direction == .Right)
        {
            imageIndex--;
            
            
            if(imageIndex < 0)
            {
                imageIndex = maxIndex;
            }
        }
        //Displaying Frames in UIImageView
        imageFrame.image = UIImage (named:images[imageIndex])
        
        
        
        
    }
    
    @IBAction func pinchImage(sender: UIPinchGestureRecognizer) {
        let lastScaleFactor:CGFloat = 1;
        let factor:CGFloat = sender.scale;
        if(factor > 1){
            imageFrame.transform = CGAffineTransformMakeScale((lastScaleFactor + (factor - 1)), lastScaleFactor + (factor - 1));
            
        }
        else {
            imageFrame.transform = CGAffineTransformMakeScale(lastScaleFactor * factor, lastScaleFactor * factor);
            
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

