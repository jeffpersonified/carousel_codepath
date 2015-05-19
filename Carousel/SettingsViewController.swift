//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Jeff Smith on 5/18/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsScrollView.contentSize = CGSize(width: 320, height: 695)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
