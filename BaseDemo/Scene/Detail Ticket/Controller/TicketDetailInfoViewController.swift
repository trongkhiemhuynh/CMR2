//
//  CreateTicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailInfoViewController: BaseViewController {

    @IBOutlet weak var cvInfoDetail : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func setupView() {
        cvInfoDetail.registerCell(TicketDetailInfoCollectionViewCell.self)
        cvInfoDetail.registerCell(TicketDetailInputInfoCollectionViewCell.self)
        cvInfoDetail.registerCell(NewTicketCheckboxCollectionViewCell.self)
        cvInfoDetail.backgroundColor = Color.BackgroundListColor()
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
        return arrInputTicket.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInfoCollectionViewCell
            
            return cell1
        } else {
            
            let icName = arrIcTicket[indexPath.row - 1]
            let titleName = arrInputTicket[indexPath.row-1]
            
            if titleName.contains("Escalated") || titleName.contains("Done") {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewTicketCheckboxCollectionViewCell.identifier, for: indexPath) as? NewTicketCheckboxCollectionViewCell
                cell?.lblTitle.text = titleName
                cell?.vContent.backgroundColor = Color.BackgroundListColor()
                cell?.btnCheckbox.isEnabled = false
                return cell!
            } else {
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInputInfoCollectionViewCell.identifier, for: indexPath) as? TicketDetailInputInfoCollectionViewCell
                cell2?.isUserInteractionEnabled = false
                cell2!.onUpdate(image: UIImage(named: icName), title: titleName, detail: titleName)
                cell2?.tf.backgroundColor = Color.BackgroundListColor()
                return cell2!
            }
            
        }
    }
    
}

extension TicketDetailInfoViewController : UICollectionViewDelegate {
    
}

extension TicketDetailInfoViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvInfoDetail.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        if indexPath.row == 0 {
            return CGSize(width: widthPerItem, height: heightHeaderDetailTicket)
        } else {
            return CGSize(width: widthPerItem, height: heightLargeCell)
        }

    }
}
