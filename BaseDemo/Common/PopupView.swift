//
//  LoadingView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class PopupView : BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var iv : UIImageView!
    @IBOutlet weak var tbl : UITableView!
    
    let ID = "popupID"
//    override func commonInit() {
//        Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
//        addSubview(vContent)
//        vContent.frame = self.bounds
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.iv.layer.cornerRadius = 8.0
        
        self.tbl.register(UITableViewCell.self, forCellReuseIdentifier: ID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension PopupView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath)
        cell.textLabel?.text = "Steve"
        return cell
    }
}

extension PopupView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("123")
    }
}
