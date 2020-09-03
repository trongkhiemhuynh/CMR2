//
//  CustomDashLion.swift
//  BaseDemo
//
//  Created by macOS on 8/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Charts

class CustomDashLion: UIView {

    @IBOutlet weak var vBarChart : UIView!
    @IBOutlet weak var vPieChart : UIView!
    @IBOutlet weak var vInfoUser : UIView!
    
    @IBAction func tapMenu() {
        print(#function)
    }
    
    @IBAction func tapAlert() {
        print(#function)
    }
    
    func addBartChartView() {
        let chart = BarChartView(frame: vBarChart.bounds)
        vBarChart.addSubview(chart)
    }
    
    func addPieChartView() {
        let chart = PieChartView(frame: vPieChart.bounds)
        vPieChart.addSubview(chart)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
