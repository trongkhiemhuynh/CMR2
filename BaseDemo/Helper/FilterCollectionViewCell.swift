//
//  FilterCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FSCalendar

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv:UIImageView!
    @IBOutlet weak var tf : SkyFloatingLabelTextField!
    
    private var vCal : CalendarView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iv.image = UIImage(named: "calendar")
        iv.isHidden = true
        tf.selectedLineColor = BASEColor.MainAppColor()
        tf.selectedTitleColor = BASEColor.MainAppColor()
        tf.textErrorColor = .red
    }
    
    func onShowCalendar() {
        vCal = CalendarView.xibInstance()
        vCal?.fsCalendar.delegate = self
        superview!.addSubview(vCal!)
        vCal?.frame = superview!.bounds
    }

}

extension FilterCollectionViewCell: XibInitalization {
    typealias Element = FilterCollectionViewCell
}

extension FilterCollectionViewCell: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = ApplicationManager.sharedInstance.defaultDateFormatter
        let strDate = formatter.string(from: date)
        
        tf.text = strDate
        vCal?.removeFromSuperview()
        print("selected date : ",strDate)
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let strDate = ApplicationManager.sharedInstance.globalDateFormatter.string(from: date)
        
        print("deselected date : ",strDate)
    }
}
