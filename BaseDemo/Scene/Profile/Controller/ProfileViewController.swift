//
//  ProfileViewController.swift
//  BaseDemo
//
//  Created by khiemht on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func setupView() {
        let v = MagicCollectionView.xibInstance()
        v.controller = self
        v.dictData = ["0":["profile"]]
        //register cell, header for profile
        v.collectionView.registerCell(ProfileCollectionViewCell.self)
        v.collectionView.register(ProfileCollectionReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier)
        view.backgroundColor = BASEColor.BackgroundListColor()
        v.collectionView.backgroundColor = BASEColor.BackgroundListColor()
        view.addSubview(v)
        
        v.frame = view.frame
        
        //show navigation bar
        navigationController?.navigationBar.isHidden = false
        title = "Profile"
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

extension ProfileViewController : XibInitalization {
    typealias Element = ProfileViewController
}
