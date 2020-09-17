//
//  EmailView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import WebKit

class EmailView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //variable
    //add webview
    var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Logger.debug("awakeFromNib")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        vContent.addSubview(webView)
        webView.frame = self.bounds
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}

extension EmailView: WKNavigationDelegate {
    
}

extension EmailView: XibInitalization {
    typealias Element = EmailView
}
