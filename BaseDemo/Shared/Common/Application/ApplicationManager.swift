//
//  ApplicationManager.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ApplicationManager {
    
    //
    // MARK: - Variable
    static let sharedInstance = ApplicationManager()
    
    var mainTabbar: MainAppController?
    var itemMenuSelected: ItemMenu?
    var templateDashboard: DashboardType = .manager
    
    // Global Date formatter
    lazy var globalDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = NSLocale.init(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'zzz'Z'"
        return dateFormatter
    }()
    
    lazy var defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter
    }()
    
    
    //
    // MARK: Public
    
    /// SDK
    func initAllSDKs() {
        
    }
    
    
    /// Common
    func initCommon() {
        
        // Logger
        self.initLogger()
        
        // Global Appearance
        self.initGlobalAppearance()
    }
    
}


//
// MARK: - Private
extension ApplicationManager {
    
    // Logger
    fileprivate func initGlobalAppearance() {
        
    }
}


// MARK:
// MARK: Logger
extension ApplicationManager {
    fileprivate func initLogger() {
        Logger.initLogger()
    }
}
