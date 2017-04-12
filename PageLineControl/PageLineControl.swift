//
//  PageLineControl.swift
//  PageLineControl
//
//  Created by Zakk Hoyt on 3/9/17.
//  Copyright © 2017 Zakk Hoyt. All rights reserved.
//

import UIKit

@IBDesignable
public class PageLineControl: UIView {

    // MARK: Public variables
    
    /// The total number of page "dots"
    @IBInspectable
    public var numberOfPages: Int = 0 {
        didSet {
            update()
        }
    }
    
    /// The current page "dot"
    @IBInspectable
    public var currentPage: Int = 0 {
        didSet {
            update()
        }
    }
    
    /// hide the the indicator if there is only one page. default is NO
    @IBInspectable
    public var hidesForSinglePage: Bool = false {
        didSet {
            update()
        }
    }
    
    /// if set, clicking to a new page won't update the currently displayed page until -updateCurrentPageDisplay is called. default is NO
    @IBInspectable
    public var defersCurrentPageDisplay: Bool = false {
        didSet {
            update()
        }
    }
    
    /// if set, current page and all previous are shaded. If not, only the current page is shaded. Default is NO
    @IBInspectable
    public var cumulative: Bool = false {
        didSet {
            update()
        }
    }

    // MARK: Private variables
    
    fileprivate var lines: [CAShapeLayer] = []

    // MARK: Public methods
    
    /// update page display to match the currentPage. ignored if defersCurrentPageDisplay is NO. setting the page value directly will update immediately
    public func updateCurrentPageDisplay() {
        if defersCurrentPageDisplay == false {
            return
        }
        
        update(force: true)
    }
    
    /// returns minimum size required to display dots for given page count. can be used to size control if page count could change
    public func size(forNumberOfPages pageCount: Int) -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }

    /// color of the track
    @IBInspectable
    public var pageIndicatorTintColor: UIColor = UIColor.lightGray {
        didSet {
            update()
        }
    }
    
    /// color of the current page, and previous pages if continuous is enabled
    @IBInspectable
    public var currentPageIndicatorTintColor: UIColor = UIColor.white {
        didSet {
            update()
        }
    }

    // MARK: Public methods
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .clear
    }

    // MARK: Overrides
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    
    public override func draw(_ rect: CGRect) {
        update()
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 4.0)
    }

    // MARK: Private methods
    
    fileprivate func update(force: Bool = false) {
        
        for line in lines {
            line.removeFromSuperlayer()
        }
        lines.removeAll()
        
        // Dont' display if there are no pages
        if numberOfPages == 0 {
            return
        }
        
        // Adhere to hidesForSinglePage
        if hidesForSinglePage == true {
            if numberOfPages <= 1 {
                return
            }
        }
        
        // Adhere to defersCurrentPageDisplay
        if defersCurrentPageDisplay == true && force == false {
            return
        }
        
        let height: CGFloat = bounds.height
        let width: CGFloat = bounds.width / CGFloat(numberOfPages)
        let y: CGFloat = 0
        for i in 0..<numberOfPages {
            
            let x: CGFloat = width * CGFloat(i)
            let frame = CGRect(x: x, y: y, width: width, height: height)
            
            let line = CAShapeLayer()
            let path = UIBezierPath(rect: frame).cgPath
            line.path = path
            
            if cumulative {
                if i <= currentPage {
                    line.fillColor = currentPageIndicatorTintColor.cgColor
                    line.strokeColor = currentPageIndicatorTintColor.cgColor
                } else {
                    line.fillColor = pageIndicatorTintColor.cgColor
                    line.strokeColor = pageIndicatorTintColor.cgColor
                }
            } else {
                if i == currentPage {
                    line.fillColor = currentPageIndicatorTintColor.cgColor
                    line.strokeColor = currentPageIndicatorTintColor.cgColor
                } else {
                    line.fillColor = pageIndicatorTintColor.cgColor
                    line.strokeColor = pageIndicatorTintColor.cgColor
                }
            }
            
            layer.addSublayer(line)
            lines.append(line)
        }
    }
}
