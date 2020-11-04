//
//  ReportController.swift
//  BaseDemo
//
//  Created by macOS on 10/29/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ReportController: BaseViewController {

    @IBOutlet weak var vStage: UIView!
    
    var customStage: CustomTicketStageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        let magic = MagicCollectionView.xibInstance()
        magic.dictData = ["0": ["Report SI","Report CS","Report HR","Report SE","Report IS","Report Marketing","Report Sale"]]
        magic.heightHeader = heightHeaderDefault
        magic.heightCell = height100Cell
        magic.collectionView.registerCell(ReportCollectionViewCell.self)
        magic.viewType = .report
        magic.frame = vContent.bounds
        
        vContent.addSubview(magic)
    }
    
    func setupStageView() {
        customStage = Bundle.main.loadNibNamed("CustomTicketStageView", owner: self, options: nil)?.first as? CustomTicketStageView
        Logger.info(customStage!.frame)
        vStage.addSubview(customStage!)
        
        customStage?.setupLayout()
        customStage?.backgroundColor = .red

        customStage?.arrStage = ["All report","Organization report","Activities report"]
        customStage?.itemsPerRow = 2
        
        customStage?.cvStage.isScrollEnabled = true
        customStage?.frame = CGRect(origin: .zero, size: CGSize(width: vStage.bounds.width, height: vStage.bounds.height))
        
        customStage?.cvStage.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Logger.info(self.view.bounds)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Logger.info(self.vStage.bounds)
//        self.vStage.frame = CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: 60))
//        self.view.layoutIfNeeded()
        setupStageView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
