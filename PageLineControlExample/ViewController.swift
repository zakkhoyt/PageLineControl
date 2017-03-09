//
//  ViewController.swift
//  ProgressLine
//
//  Created by Zakk Hoyt on 3/9/17.
//  Copyright © 2017 Zakk Hoyt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pageLineControl: PageLineControl!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageLineControl.numberOfPages = pageControl.numberOfPages
        pageLineControl.currentPage = pageControl.currentPage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        pageControl.currentPage = Int(sender.value)
        pageLineControl.currentPage = Int(sender.value)
    }
    
}

