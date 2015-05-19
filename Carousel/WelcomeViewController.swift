//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photosScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosScrollView.contentSize = CGSize(width: 320, height: 1136)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
