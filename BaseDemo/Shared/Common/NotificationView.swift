//
//  NotificationView.swift
//  BaseDemo
//
//  Created by macOS on 9/9/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NotificationView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let dumData = ["Nguyen Van Teo", "Le Thi Mit", "Tran Van Ti", "Nguyen Thi Man"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func didBack() {
        removeFromSuperview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.register(NotificationTableViewCell.self)
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor.init(hex: "#EBEBEB")
        tableView.rowHeight = heightMediumCell
        
        btnBack.centerButtonAndImageWithSpacing(spacing: 8.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension NotificationView : XibInitalization {
    typealias Element = NotificationView
}

extension NotificationView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dumData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
        cell.lblName.text = dumData[indexPath.row] + " sent you a message"
        
        cell.lblTime.text = "\(indexPath.row) minutes ago"
        cell.iv.image = UIImage(named: "ivanka_trump")
        
        return cell
    }
}
