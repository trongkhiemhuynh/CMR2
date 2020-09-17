//
//  NotesView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NotesView: BaseView {
    @IBOutlet var vBound : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        print("NotesView",#line)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("NotesView",#line)
        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = vBound.bounds
        vMagic.dictData = ["0":["Note","Note1","Note2","Note3","Note4","Note5"]]
        vMagic.magicDatasource.type = .extend
        vMagic.controller = UIViewController()
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        
        vBound.addSubview(vMagic)
    }
    
    @IBAction func didAdd() {
        
    }

}

extension NotesView: XibInitalization {
    typealias Element = NotesView
}
