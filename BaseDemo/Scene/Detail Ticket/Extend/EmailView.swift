//
//  EmailView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import WebKit

let urlEmail = "https://www.apple.com/apple-events/"

class EmailView: BaseView {
    //variable
    var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Logger.debug("awakeFromNib")
    }
    
    /// setup view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let presenter = getPresenterView(title: "Email", isAddNew: false)
        
        //body
        webView = WKWebView()
        webView.navigationDelegate = self

        let url = URL(string: urlEmail)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        presenter.vContent.addSubview(webView)
        webView.frame = CGRect(origin: .zero, size: CGSize(width: widthScreen, height: heightScreen - presenter.vTitle.bounds.height - heightTabbar))
        //add subview
        self.addSubview(presenter)
    }

}

extension EmailView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish load email")
        controller?.onDismissLoading()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        controller?.onLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        controller?.onDismissLoading()
    }
}

extension EmailView: XibInitalization {
    typealias Element = EmailView
}
