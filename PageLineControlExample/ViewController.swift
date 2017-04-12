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
    @IBOutlet weak var stepper: UIStepper!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        pageControl.currentPage = Int(sender.value)
        pageLineControl.currentPage = Int(sender.value)
    }
    
    @IBAction func cumulativeSwitchValueChanged(_ sender: UISwitch) {
        pageLineControl.cumulative = sender.isOn
    }
}

