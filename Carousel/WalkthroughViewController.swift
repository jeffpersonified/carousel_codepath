
//
//  WalkthroughViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var walkthroughScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walkthroughScrollView.contentSize = CGSize(width: 1280, height: 568)
        walkthroughScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        var page : Int = Int(round(walkthroughScrollView.contentOffset.x / 320))
        
        tutorialPageControl.currentPage = page
    }
}
