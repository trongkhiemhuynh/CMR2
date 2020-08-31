//
//  CreatNewTicketView.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CreatNewTicketView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var tvCreatNew : UITableView!
    

    @IBAction func actionBack() {
        self.removeFromSuperview()
    }
    
    @IBAction func actionSave() {
        print("---- ", #function)
        
//        let v11 = Bundle.main.loadNibNamed("InfoTicketRow", owner: self, options: nil)?.first as! InfoTicketRow
//        v11.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
//
//        let v12 = Bundle.main.loadNibNamed("InfoTicketRow", owner: self, options: nil)?.first as! InfoTicketRow
//        v11.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
////        let v1 = InfoTicketRow(frame: )
////        let v2 = InfoTicketRow(frame: CGRect(x: 0, y: 70, width: 200, height: 70))
//        self.sv.addArrangedSubview(v11)
//        self.sv.addArrangedSubview(v12)
    }
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
//
//        tvCreatNew.register(UINib(nibName: "", bundle: nil), forCellReuseIdentifier: "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tvCreatNew.register(UINib(nibName: "", bundle: nil), forCellReuseIdentifier: "")
    }
    
    
}



//extension CreatNewTicketView : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//    }
//    
//    
//}

//extension CreatNewTicketView : UITableViewDelegate {
//    
//}
//
//extension CreatNewTicketView : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//}
