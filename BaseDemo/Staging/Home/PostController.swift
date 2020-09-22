//
//  HomeViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/7/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class PostController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        vTitle.lblTitle.text = "Post"
        let vPost = PostView.xibInstance()
        vContent.addSubview(vPost)
        vPost.frame = vContent.bounds
        vPost.controller = self
    }
}

extension PostController: XibInitalization {
    typealias Element = PostController
}
