//
//  CustomListView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol CustomListViewOutput : class {
    func didChangeSort(with name : String?)
    func didSelectItem(with id : String)
}

class CustomListView: BaseView {

    // outlet
    @IBOutlet weak var lblCount : UILabel!

    @IBOutlet weak var btnSorted : UIButton!
    @IBOutlet weak var vCounted : UIView!
    @IBOutlet weak var vSorted : UIView!
    
    @IBOutlet weak var cvList : UICollectionView!
    @IBOutlet weak var vBgList : UIView!
    
    // variable
    weak var delegate : CustomListViewOutput?
    public var controller : TicketController?
    
    private let itemsPerRow: CGFloat = 1
    private let heightCell : CGFloat = 80
    
    var dummyData : [String:Any] = ["New" : ["HUYNH","HUYNH","HUYNH","HUYNH","HUYNH","HUYNH","HUYNH"], "Processing": ["KHIEM","KHIEM","KHIEM","KHIEM","KHIEM","KHIEM","KHIEM"], "Escalated": ["TRONG","TRONG","TRONG","TRONG","TRONG","TRONG","TRONG"], "Pending":["DAT","DAT","DAT","DAT","DAT","DAT","DAT"], "Upcoming":["DUC","DUC","DUC","DUC","DUC","DUC","DUC"]]
    
    lazy var arrDummy : [String]? = {
        return dummyData["New"] as? Array<String>
    }()
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomListView", owner: self, options: nil)
        addSubview(vContent)
        
        vContent.frame = self.bounds

        vSorted.layer.cornerRadius = 12
        vCounted.layer.cornerRadius = 12

        cvList.registerCell(CustomTicketCollectionViewCell.self)
        
        cvList.backgroundColor = BASEColor.BackgroundListColor()
        vBgList.backgroundColor = BASEColor.BackgroundListColor()
        vContent.backgroundColor = BASEColor.BackgroundListColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        controller?.delegate = self
    }
    
    @IBAction func changeSort() {
        delegate?.didChangeSort(with: btnSorted.titleLabel?.text)
    }

}

extension CustomListView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDummy?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTicketCollectionViewCell.identifier, for: indexPath) as! CustomTicketCollectionViewCell
        
        let name = arrDummy?[indexPath.row]
        
        cell.updateData(TicketListModel(name: name!, id: "7878787878", status: "Done"))
        
        return cell
    }
}

extension CustomListView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(with: "id_user")
    }
}

extension CustomListView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //2
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvList.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsetsDefault
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsetsDefault.left
    }
}

extension CustomListView : CustomListViewInput {
    func updateListView(with stage: String) {
        arrDummy = dummyData[stage] as? Array
        cvList.reloadData()
    }
}
