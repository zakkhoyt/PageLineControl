//
//  PageLineControl.swift
//  PageLineControl
//
//  Created by Zakk Hoyt on 3/9/17.
//  Copyright © 2017 Zakk Hoyt. All rights reserved.
//

import UIKit

@IBDesignable
class PageLineControl: UIView {

    @IBInspectable
    var numberOfPages: Int = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable
    var currentPage: Int = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable
    var pageIndicatorTintColor: UIColor = UIColor.lightGray {
        didSet {
            update()
            
        }
    }
    
    @IBInspectable
    var currentPageIndicatorTintColor: UIColor = UIColor.white {
        didSet {
            update()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 4.0)
    }


    fileprivate var lines: [CAShapeLayer] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    fileprivate func update() {
        
        for line in lines {
            line.removeFromSuperlayer()
        }
        lines.removeAll()
        
        
        let height: CGFloat = bounds.height
        let width: CGFloat = bounds.width / CGFloat(numberOfPages)
        let y: CGFloat = 0
        for i in 0..<numberOfPages {
            let x: CGFloat = width * CGFloat(i)
            let frame = CGRect(x: x, y: y, width: width, height: height)
            
            let line = CAShapeLayer()
            let path = UIBezierPath(rect: frame).cgPath
            line.path = path
            
            if i == currentPage {
                line.fillColor = currentPageIndicatorTintColor.cgColor
                line.strokeColor = currentPageIndicatorTintColor.cgColor
            } else {
                line.fillColor = pageIndicatorTintColor.cgColor
                line.strokeColor = pageIndicatorTintColor.cgColor
            }
            
            layer.addSublayer(line)
        }
        
    }
}
