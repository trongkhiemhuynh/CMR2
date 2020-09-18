//
//  TasksView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TasksView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        let lblCountTask = UILabel()
        lblCountTask.text = "Number of tasks: 6"
        lblCountTask.frame = CGRect(x: 8, y: 8, width: widthScreen, height: 20)

        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = CGRect(x: 0, y: 50, width: widthScreen, height: heightScreen - 150)
        vMagic.dictData = ["0":["Task1","Task2","Task3","Task4","Task5","Task6"]]
        vMagic.magicDatasource.type = .extend
        vMagic.controller = UIViewController()
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        
        self.addSubview(vMagic)
        self.addSubview(lblCountTask)
    }
}
