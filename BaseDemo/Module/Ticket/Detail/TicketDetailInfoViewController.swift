//
//  CreateTicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailInfoViewController: BaseViewController {

    let reuseID1 = "reuseID1"
    let reuseID2 = "reuseID2"
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 10.0)
    private let itemsPerRow: CGFloat = 1
    private let heightCellInfo : CGFloat = 120
    private let heightCellInfoDetail : CGFloat = 70
    
    @IBOutlet weak var cvInfoDetail : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func setupView() {
        cvInfoDetail.register(UINib(nibName: "TicketDetailInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseID1)
        cvInfoDetail.register(UINib(nibName: "TicketDetailStatusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseID2)
        
        cvInfoDetail.backgroundColor = BASEColor.BackgroundListColor()
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

extension TicketDetailInfoViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID1, for: indexPath) as! TicketDetailInfoCollectionViewCell
            
            return cell1
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID2, for: indexPath) as! TicketDetailStatusCollectionViewCell
            cell2.reloadData(im: UIImage(named: "filter")!, title: "Ticket owner", name: "Apple Inc.")
            return cell2
        }
    }
    
    
}

extension TicketDetailInfoViewController : UICollectionViewDelegate {
    
}

extension TicketDetailInfoViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //2
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvInfoDetail.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        if indexPath.row == 0 {
            return CGSize(width: widthPerItem, height: heightCellInfo)
        } else {
            return CGSize(width: widthPerItem, height: heightCellInfoDetail)
        }

    }
}
