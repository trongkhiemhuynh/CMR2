//
//  CalendarView.swift
//  BaseDemo
//
//  Created by macOS on 9/1/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarView: UIView {

    @IBOutlet weak var fsCalendar : FSCalendar!
    
    
    @IBAction func close() {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension CalendarView: XibInitalization {
    typealias Element = CalendarView
}
