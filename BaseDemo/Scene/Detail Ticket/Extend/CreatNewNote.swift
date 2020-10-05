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
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var btnUnderline : UIButton!
    @IBOutlet weak var btnItalic : UIButton!
    @IBOutlet weak var btnBold : UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDismissKeyboard))
        self.addGestureRecognizer(tapRecognizer)
        
        tv.layer.cornerRadius = corner8Radius
        tf.layer.cornerRadius = corner8Radius
        
        self.backgroundColor = Color.BackgroundListColor()
//        tf.layer.borderWidth = 1.0
//        tf.layer.borderColor = Color.BackgroundListColor().cgColor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        tv.dropShadow(color: Color.CellShadowColor)
//        tf.dropShadow(color: Color.CellShadowColor)
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
