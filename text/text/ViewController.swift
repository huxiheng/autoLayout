//
//  ViewController.swift
//  text
//
//  Created by Tesiro on 16/11/11.
//  Copyright © 2016年 Tesiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var menuHeightConstraint : NSLayoutConstraint!
    
    var isMenuOpen = false
    var iterms : [Int] = [5,6,7]
    
    @IBAction func actionToggleMenu(_ sender: Any) {
        isMenuOpen = !isMenuOpen
        for con in (titleLabel.superview?.constraints)! {
            print("->\(con.description)")
        }
        
        for constraint in titleLabel.superview!.constraints {
            if constraint.firstItem as? NSObject == titleLabel && constraint.firstAttribute == .centerY {
//                constraint.constant = isMenuOpen ? -100 : 0.0
//                 continue
            }
            if constraint.identifier == "TitleCenterY" {
                constraint.isActive = false; //移除之前的约束，需要添加一个新的约束
                let newConstraint = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: titleLabel.superview, attribute: .centerY, multiplier: isMenuOpen ? 0.64 : 1.0, constant: 5.0)
                newConstraint.identifier = "TitleCenterY"
                newConstraint.isActive = true
                continue
            }
        }
        
        
        menuHeightConstraint.constant = isMenuOpen ? 200.0 : 60.0
        titleLabel.text = isMenuOpen ? "select iterm" : "packing list"
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            () -> Void in
            self.view.layoutIfNeeded()//
            let angle = self.isMenuOpen ? CGFloat(M_PI_4) : 0.0
            self.buttonMenu.transform = CGAffineTransform(rotationAngle: angle)
            
            }, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

