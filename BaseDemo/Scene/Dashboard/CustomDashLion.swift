//
//  CustomDashLion.swift
//  BaseDemo
//
//  Created by macOS on 8/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Charts

class CustomDashLion: BaseView {

    @IBOutlet weak var vBarChart : UIView!
    @IBOutlet weak var vPieChart : UIView!
    @IBOutlet weak var vInfoUser : UIView!
    @IBOutlet weak var lblCountNotification : UILabel!
    
    var optionsBarChart: [Option]!
    
    @IBAction func tapMenu() {
        print(#function)
    }
    
    @IBAction func tapAlert() {
        print(#function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lblCountNotification.layer.cornerRadius = lblCountNotification.bounds.height/2
        lblCountNotification.clipsToBounds = true
        Logger.info("khiemht \(vBarChart.bounds)")
    }
    
    func addBartChartView() {
        Logger.info(vBarChart.bounds)
        let chart = BarChartView(frame: vBarChart.bounds)
        chart.autoresizingMask = [.flexibleWidth, .flexibleHeight,.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        
        vBarChart.addSubview(chart)
        setupBarChart(chartView : chart)
    }
    
    func addPieChartView() {
        let chart = PieChartView(frame: vPieChart.bounds)
//        chart.autoresizingMask = [.flexibleWidth, .flexibleHeight,.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        
        vPieChart.addSubview(chart)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setup(barLineChartView chartView: BarLineChartViewBase) {
        chartView.chartDescription?.enabled = false
                
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        
        // ChartYAxis *leftAxis = chartView.leftAxis;
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        
        chartView.rightAxis.enabled = false
    }
    
    func setupBarChart(chartView : BarChartView) {
        
        optionsBarChart = [.toggleValues,
                           .toggleHighlight,
                           .animateX,
                           .animateY,
                           .animateXY,
                           .saveToGallery,
                           .togglePinchZoom,
                           .toggleData,
                           .toggleBarBorders]
        
        self.setup(barLineChartView: chartView)
        
        //            chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        
        chartView.maxVisibleCount = 60
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
        
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 100
        leftAxisFormatter.maximumFractionDigits = 1000
        leftAxisFormatter.negativeSuffix = " $"
        leftAxisFormatter.positiveSuffix = " $"
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        
                    let rightAxis = chartView.rightAxis
                    rightAxis.enabled = true
                    rightAxis.labelFont = .systemFont(ofSize: 10)
                    rightAxis.labelCount = 8
                    rightAxis.valueFormatter = leftAxis.valueFormatter
                    rightAxis.spaceTop = 0.15
                    rightAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
        //        chartView.legend = l
        
        let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
                                  font: .systemFont(ofSize: 12),
                                  textColor: .white,
                                  insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
                                  xAxisValueFormatter: chartView.xAxis.valueFormatter!)
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        
        let start = 1
        let count = 7
        let range : UInt32 = 1
        
        let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult))
            if arc4random_uniform(100) < 25 {
                return BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
            } else {
                return BarChartDataEntry(x: Double(i), y: val)
            }
        }
        
        var set1: BarChartDataSet! = nil
        set1 = BarChartDataSet(entries: yVals, label: "The year 2017")
        set1.colors = ChartColorTemplates.liberty()
        set1.drawValuesEnabled = false
        
        let data = BarChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
        data.barWidth = 0.9
        chartView.data = data
        
    }
    
//    func setDataCount(_ count: Int, range: UInt32) {
//            let start = 1
//
//            let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
//                let mult = range + 1
//                let val = Double(arc4random_uniform(mult))
//                if arc4random_uniform(100) < 25 {
//                    return BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
//                } else {
//                    return BarChartDataEntry(x: Double(i), y: val)
//                }
//            }
//
//            var set1: BarChartDataSet! = nil
//            if let set = chartView.data?.dataSets.first as? BarChartDataSet {
//                set1 = set
//                set1.replaceEntries(yVals)
//                chartView.data?.notifyDataChanged()
//                chartView.notifyDataSetChanged()
//            } else {
//                set1 = BarChartDataSet(entries: yVals, label: "The year 2017")
//                set1.colors = ChartColorTemplates.material()
//                set1.drawValuesEnabled = false
//
//                let data = BarChartData(dataSet: set1)
//                data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
//                data.barWidth = 0.9
//                chartView.data = data
//            }
//
//    //        chartView.setNeedsDisplay()
//        }

}
