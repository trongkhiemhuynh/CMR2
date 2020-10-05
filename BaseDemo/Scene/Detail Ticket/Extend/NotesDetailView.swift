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
        tv.layer.cornerRadius = corner8Radius
        self.backgroundColor = Color.BackgroundListColor()
    }
}

extension NotesDetailView: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
}

extension NotesDetailView: XibInitalization {
    typealias Element = NotesDetailView
}

