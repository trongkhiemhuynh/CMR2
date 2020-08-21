//
//  Extention.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func add(_ child: UIViewController, contentView: UIView) {
//        addChild(child)
        contentView.addSubview(child.view)
        child.view.frame = contentView.bounds
        child.didMove(toParent: self)
    }
    
    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
//        removeFromParent()
    }
}

extension UIButton {
    func centerButtonAndImageWithSpacing(spacing : CGFloat) {
        let insetAmount = spacing/2.0
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right:  -insetAmount)
    }
}

extension UIColor {
    convenience init?(hex : String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            print(hexColor)
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255
                    a = 1.0
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    convenience init?(red: CGFloat, green: CGFloat, blue: CGFloat) {
        let r,g,b : CGFloat
        
        r = red/255
        g = green/255
        b = blue/255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
