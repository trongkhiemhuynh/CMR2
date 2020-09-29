//
//  NotesDetailView.swift
//  BaseDemo
//
//  Created by macOS on 9/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NotesDetailView: BaseView {
    @IBOutlet weak var tv: UITextView!

    override func awakeFromNib() {
//        super.awakeFromNib()
        
        tv.isUserInteractionEnabled = false
    }
}

extension NotesDetailView: XibInitalization {
    typealias Element = NotesDetailView
}
