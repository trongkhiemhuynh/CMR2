//
//  SortContactsView.swift
//  BaseDemo
//
//  Created by macOS on 9/9/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol SortContactsViewOutput: class {
    func didSelect(item : String)
}

class SortContactsView: UIView {
    
    @IBOutlet weak var tv : UITableView!
    
    // delegate
    weak var delegate : SortContactsViewOutput?
    
    // varible
    var dummyData : [String] = ["Last activity","Fist name","Last name","Contact owner","Create date","Lead status","Last contacted"]
    var selectedIdx : IndexPath = IndexPath(row: 0, section: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tv.register(SortContactsViewCell.self)
    }
    
    @IBAction func didBack() {
        removeFromSuperview()
    }
}

extension SortContactsView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SortContactsViewCell.identifier, for: indexPath) as! SortContactsViewCell
        cell.lbl.text = dummyData[indexPath.row]
        
        if selectedIdx == indexPath {
            cell.iv.isHidden = false
        }
        
        return cell
    }
}

extension SortContactsView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortContactsViewCell
        cell.iv.isHidden = false
        
        let cell1 = tableView.cellForRow(at: selectedIdx) as! SortContactsViewCell
        cell1.iv.isHidden = true
        
        // update selected indexpath
        selectedIdx = indexPath
        
        delegate?.didSelect(item: cell.lbl.text!)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        let cell = tableView.cellForRow(at: indexPath) as! SortContactsViewCell
        cell.iv.isHidden = true
        
        return indexPath
    }
}

extension SortContactsView : XibInitalization {
    typealias Element = SortContactsView
}
