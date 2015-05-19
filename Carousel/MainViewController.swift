//
//  MainViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var carouselScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselScrollView.contentSize = CGSize(width: 320, height: 1564)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
