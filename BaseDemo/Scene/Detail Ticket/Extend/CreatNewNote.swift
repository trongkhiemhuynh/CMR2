//
//  CreatNewNote.swift
//  BaseDemo
//
//  Created by macOS on 9/18/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CreatNewNote: BaseView {

    //outlet
    @IBOutlet weak var vTitleView : CustomTitleView!
    @IBOutlet weak var tf : UITextField!
    @IBOutlet weak var tv : UITextView!
    @IBOutlet weak var btnUnderline : UIButton!
    @IBOutlet weak var btnItalic : UIButton!
    @IBOutlet weak var btnBold : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tf.placeholder = "Typing..."
        vTitleView.lblTitle.text = "Create new note"
    }
    
    @IBAction func back() {
        removeFromSuperview()
    }
    
    @IBAction func save() {
        removeFromSuperview()
    }
    
    @IBAction func didBold() {
        
    }

    @IBAction func didItalic() {
        
    }
    
    @IBAction func didUnderline() {
        
    }
}

extension CreatNewNote: XibInitalization {
    typealias Element = CreatNewNote
}
