//
//  CustomListView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import RealmSwift

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
    
    private let itemsPerRow: CGFloat = 1
    private let heightCell : CGFloat = 80
    
    private var status: String? = "New"
    
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
        
        //FIXME read data from realm demo
//        readFile()
//        fetchVocabularyFromInitRealmDB()
    }
    
    private func readFile() {
//        let stringPath = Bundle.main.path(forResource: "demo", ofType: "realm")
//        let urlPath = Bundle.main.url(forResource: "demo", withExtension: "realm")
//
//        var config = Realm.Configuration()
//        config.fileURL = urlPath
//        config.readOnly = true
//
//        let realm = try! Realm(configuration: config)
//
//        let obj = realm.dynamicObjects("Profile")
//        Logger.debug(obj.count)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func fetchVocabularyFromInitRealmDB() {
//        let realm = try! Realm()
//
////        if vocabularyList.count > 0 {
////            return vocabularyList
////        }
//
//        let dataFilePath = Bundle.main.path(forResource: "demo", ofType: "realm")
//        let defaultPath = realm.configuration.fileURL?.path
//        guard defaultPath != nil &&  dataFilePath != nil else {
//            return []
//        }
//        do {
//            try FileManager.default.removeItemAtPath(defaultPath!)
//            try FileManager.default.copyItemAtPath(dataFilePath!, toPath: defaultPath!)
//        } catch {
//            print(error)
//        }
//        return vocabularyList
        
        let path = Bundle.main.path(forResource: "demo", ofType: "realm")
        Logger.info(path)
        var config = Realm.Configuration()
        config.fileURL = URL(fileURLWithPath: path!)
        
        do {
            let realm = try? Realm(configuration: config) // also tried try! Realm(path: path)
            
            let profiles = realm?.objects(Profile.self)
            Logger.debug(profiles?.count)
        } catch {
            Logger.error(error.localizedDescription)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let ticket = controller as? TicketController {
            ticket.delegate = self
        }
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
        
        cell.updateData(TicketListModel(name: name!, id: "7878787878", status: status!))
        
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
}

extension CustomListView : CustomListViewInput {
    func updateListView(with stage: String?) {
        if let stage = stage {
            arrDummy = dummyData[stage] as? Array
            status = stage
            cvList.reloadData()
        }
    }
}
