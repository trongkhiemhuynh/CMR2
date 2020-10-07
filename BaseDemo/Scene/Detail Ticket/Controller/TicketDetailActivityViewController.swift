//
//  EscalatedViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit


class TicketDetailActivityViewController: BaseViewController {
    
    @IBOutlet weak var lblActivity : UILabel!
    @IBOutlet weak var vActivity : UIView!
    @IBOutlet weak var cvActivity : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        view.backgroundColor = Color.BackgroundListColor()
        cvActivity.backgroundColor = Color.BackgroundListColor()

        cvActivity.registerCell(TicketDetailActivityCollectionViewCell.self)
        vActivity.layer.cornerRadius = corner8Radius
    }

}

extension TicketDetailActivityViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvActivity.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightHeaderDetailTicket)
    }
    
}

extension TicketDetailActivityViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let route = ExtendRoute()
        RouterManager.shared.handleRouter(route)
        
        route.handleData { (controller) in
            controller.extendedType = .email
        }
    }
}

extension TicketDetailActivityViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
        
        return cell
    }
    
    
}
