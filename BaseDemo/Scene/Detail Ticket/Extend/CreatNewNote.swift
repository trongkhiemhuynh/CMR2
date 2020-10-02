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
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tf.placeholder = "Typing..."
        vTitleView.lblTitle.text = "Create new note"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDismissKeyboard))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @IBAction func back() {
        removeFromSuperview()
    }
    
    @IBAction func didSave() {
        let dictData = NSMutableDictionary()
        dictData.setValue(tf.text, forKey: "note_name")
        dictData.setValue(tv.text, forKey: "note_content")
        
        print(dictData)
        
        removeFromSuperview()
    }
    
    @IBAction func didBold() {
        
    }

    @IBAction func didItalic() {
        
    }
    
    @IBAction func didUnderline() {
        
    }
    
    public func hideBack() {
        btnBack.isHidden = true
    }
    
    public func hideSave() {
        btnSave.isHidden = true
    }
}

extension CreatNewNote: XibInitalization {
    typealias Element = CreatNewNote
}
